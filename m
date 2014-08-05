Return-Path: <dmtkatsa@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 47B8360DF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 15:11:35 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id e131so205997oig.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VkYmq4U4w5Dncu0Q0pRjNcWLoHlUMtXroYaDymOWwQ4=;
	b=Ehah2/DOqTZOWGC4jZIT+qPiQhaRfjtPLys1bYzo+4+YLLpA0LNrDetVJEXjs5OWfN
	So/xsRnbs7gJ/zmBy3fumDnSaJpT/806qO+XxrZLgaJgArAjvLXaZYtcfr08OXlWJ7U2
	S+wAUcq1OOXMbyGyXrv6N2jYGLpwVtUlwdamQbIkt6mz9LtxxIURSRUmCvASqrsF3btb
	Q/4d/764Fo1wuO0EEWmmMxUJHEtljgqVd+ruqt/X9s+uxrO2+7+HbJFmNpWZmPPu7F6H
	McaifzFgnEFKI8IqxxXZMsoh6P9pS/b1/DGjXaJt0ps7ucTXuIeb7UKWDZQpVwiRk/u5
	ZDxg==
MIME-Version: 1.0
X-Received: by 10.60.60.167 with SMTP id i7mr6570960oer.41.1407251496233; Tue,
	05 Aug 2014 08:11:36 -0700 (PDT)
Received: by 10.182.18.202 with HTTP; Tue, 5 Aug 2014 08:11:36 -0700 (PDT)
In-Reply-To: <1406759278-3258-1-git-send-email-dmtkatsa@gmail.com>
References: <1406759278-3258-1-git-send-email-dmtkatsa@gmail.com>
Date: Tue, 5 Aug 2014 17:11:36 +0200
Message-ID: <CA+8T1ZbzFZ8_ihCs7EeEmWXBUc-J3eicgfaXru5A5x+dC-=CpA@mail.gmail.com>
From: Dimitrios Katsaros <dmtkatsa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dimitrios Katsaros <dmtkatsa@gmail.com>
Subject: Re: [PATCH] PR_Service: Improvement of persistance of PR service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 15:11:44 -0000
Content-Type: multipart/alternative; boundary=089e0158bab48aef4904ffe34583

--089e0158bab48aef4904ffe34583
Content-Type: text/plain; charset=UTF-8

I just realised that there is a different mailing list and repo for
bitbake, I will be posting a new post with the corrected patch.


On Thu, Jul 31, 2014 at 12:27 AM, Dimitrios Katsaros <dmtkatsa@gmail.com>
wrote:

> The current implementation only commits database changes
> after database exceptions or daemon shutdown. This patch adds
> a delayed commit after every request finish, defaulting to 20 seconds.
> I chose to make the sync on the consumer thread rather than the
> producer. This is to avoid simultaneous access to the database.
> I chose to use a separate timeout than the timeout defined for
> handle_request
> in work_forever. This is because the consumer thread would reach the
> handle_request before the quit flag was set. Thus for long timeouts
> the stop_daemon function would have to wait for an equally long
> amount of time.
>
> This solution is based on this discussion :
>
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg52932.html
>
> Signed-off-by: Dimitrios Katsaros <dmtkatsa@gmail.com>
> ---
>  bitbake/lib/prserv/serv.py | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
> index 1e170ce..9c37339 100644
> --- a/bitbake/lib/prserv/serv.py
> +++ b/bitbake/lib/prserv/serv.py
> @@ -1,4 +1,4 @@
> -import os,sys,logging
> +import os,sys,logging, time
>  import signal, time, atexit, threading
>  from SimpleXMLRPCServer import SimpleXMLRPCServer,
> SimpleXMLRPCRequestHandler
>  import xmlrpclib
> @@ -36,7 +36,7 @@ singleton = None
>
>
>  class PRServer(SimpleXMLRPCServer):
> -    def __init__(self, dbfile, logfile, interface, daemon=True):
> +    def __init__(self, dbfile, logfile, interface, daemon=True,
> sync_timeout=20):
>          ''' constructor '''
>          SimpleXMLRPCServer.__init__(self, interface,
>                                      logRequests=False, allow_none=True)
> @@ -46,6 +46,8 @@ class PRServer(SimpleXMLRPCServer):
>          self.working_thread=None
>          self.host, self.port = self.socket.getsockname()
>          self.pidfile=PIDPREFIX % (self.host, self.port)
> +        self.dirty = False
> +        self.sync_timeout = sync_timeout
>
>          self.register_function(self.getPR, "getPR")
>          self.register_function(self.quit, "quit")
> @@ -70,8 +72,13 @@ class PRServer(SimpleXMLRPCServer):
>          while True:
>              (request, client_address) = self.requestqueue.get()
>              try:
> -                self.finish_request(request, client_address)
> -                self.shutdown_request(request)
> +                if request == "Sync":
> +                    self.table.sync()
> +                else:
> +                    self.finish_request(request, client_address)
> +                    self.shutdown_request(request)
> +                    self.time_from_dirty = time.time()
> +                    self.dirty = True
>              except:
>                  self.handle_error(request, client_address)
>                  self.shutdown_request(request)
> @@ -126,6 +133,13 @@ class PRServer(SimpleXMLRPCServer):
>          self.server_close()
>          return
>
> +    def handle_timeout(self):
> +        if self.dirty:
> +            # making the consumer thead perform sync to ensure thread
> safty
> +            if time.time() - self.time_from_dirty > self.sync_timeout:
> +                self.requestqueue.put(("Sync", None))
> +                self.dirty = False
> +
>      def start(self):
>          pid = self.daemonize()
>          # Ensure both the parent sees this and the child from the
> work_forever log entry above
> --
> 1.9.1
>
>

--089e0158bab48aef4904ffe34583
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just realised that there is a different mailing list and=
 repo for bitbake, I will be posting a new post with the corrected patch.<b=
r></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Th=
u, Jul 31, 2014 at 12:27 AM, Dimitrios Katsaros <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:dmtkatsa@gmail.com" target=3D"_blank">dmtkatsa@gmail.com</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The current implementation only commits data=
base changes<br>
after database exceptions or daemon shutdown. This patch adds<br>
a delayed commit after every request finish, defaulting to 20 seconds.<br>
I chose to make the sync on the consumer thread rather than the<br>
producer. This is to avoid simultaneous access to the database.<br>
I chose to use a separate timeout than the timeout defined for handle_reque=
st<br>
in work_forever. This is because the consumer thread would reach the<br>
handle_request before the quit flag was set. Thus for long timeouts<br>
the stop_daemon function would have to wait for an equally long<br>
amount of time.<br>
<br>
This solution is based on this discussion :<br>
<a href=3D"https://www.mail-archive.com/openembedded-core@lists.openembedde=
d.org/msg52932.html" target=3D"_blank">https://www.mail-archive.com/openemb=
edded-core@lists.openembedded.org/msg52932.html</a><br>
<br>
Signed-off-by: Dimitrios Katsaros &lt;<a href=3D"mailto:dmtkatsa@gmail.com"=
>dmtkatsa@gmail.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/prserv/serv.py | 22 ++++++++++++++++++----<br>
=C2=A01 file changed, 18 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py<br>
index 1e170ce..9c37339 100644<br>
--- a/bitbake/lib/prserv/serv.py<br>
+++ b/bitbake/lib/prserv/serv.py<br>
@@ -1,4 +1,4 @@<br>
-import os,sys,logging<br>
+import os,sys,logging, time<br>
=C2=A0import signal, time, atexit, threading<br>
=C2=A0from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCReques=
tHandler<br>
=C2=A0import xmlrpclib<br>
@@ -36,7 +36,7 @@ singleton =3D None<br>
<br>
<br>
=C2=A0class PRServer(SimpleXMLRPCServer):<br>
- =C2=A0 =C2=A0def __init__(self, dbfile, logfile, interface, daemon=3DTrue=
):<br>
+ =C2=A0 =C2=A0def __init__(self, dbfile, logfile, interface, daemon=3DTrue=
, sync_timeout=3D20):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39; constructor &#39;&#39;&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SimpleXMLRPCServer.__init__(self, interfa=
ce,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logRequests=3DFa=
lse, allow_none=3DTrue)<br>
@@ -46,6 +46,8 @@ class PRServer(SimpleXMLRPCServer):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.working_thread=3DNone<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.host, self.port =3D self.socket.gets=
ockname()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pidfile=3DPIDPREFIX % (self.host, se=
lf.port)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.dirty =3D False<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sync_timeout =3D sync_timeout<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.register_function(self.getPR, &quot;=
getPR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.register_function(self.quit, &quot;q=
uit&quot;)<br>
@@ -70,8 +72,13 @@ class PRServer(SimpleXMLRPCServer):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while True:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(request, client_address) =
=3D self.requestqueue.get()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.finish_reques=
t(request, client_address)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.shutdown_requ=
est(request)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if request =3D=3D =
&quot;Sync&quot;:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self=
.table.sync()<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self=
.finish_request(request, client_address)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self=
.shutdown_request(request)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self=
.time_from_dirty =3D time.time()<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self=
.dirty =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.handle_e=
rror(request, client_address)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.shutdown=
_request(request)<br>
@@ -126,6 +133,13 @@ class PRServer(SimpleXMLRPCServer):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.server_close()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
+ =C2=A0 =C2=A0def handle_timeout(self):<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.dirty:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# making the consumer thead perf=
orm sync to ensure thread safty<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if time.time() - self.time_from_=
dirty &gt; self.sync_timeout:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.requestqueue.=
put((&quot;Sync&quot;, None))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.dirty =3D Fal=
se<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def start(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D self.daemonize()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ensure both the parent sees this and th=
e child from the work_forever log entry above<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--089e0158bab48aef4904ffe34583--
