Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UbhtY-0005p2-18
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 03:49:55 +0200
Received: by mail-pa0-f49.google.com with SMTP id bi5so4177426pad.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 18:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=V9RUcVSm2FlaJllJuYbFx4PULXxL7TdDtM8p+SBc6ik=;
	b=RTuwMAshxiOk9RFqG0OKOXIDdfGKMzRoDZr+BpQC/IwwrGi8PM/Ws27y57OcxW9H6k
	TEJvLBKGE2CVGJgVdmC8HXzFU7xDIacukxDzXirE8yGcZSS8IgU2R1UHbZTgJGrG6Gn0
	mpKgE/DDfzqa3rXXxIhu8HvrIkdFvyXL1hNKg8XjMU8rnt2RJ5hFbJhX0pwyk2ciMH8d
	wVPCI3uqG+G4mWDMSHi8Vym76XmdVlYzGaczQbEeokNACS+UmQsYUj2+DTm5aTGwgW9/
	z0CbWx/OakojgFRtxOSJ33wVjtRe/NTNsv3xp4BCcSdMcDWJ5ey7A7hVXn531eDAwv9d
	j2iw==
MIME-Version: 1.0
X-Received: by 10.68.166.229 with SMTP id zj5mr1500899pbb.167.1368408694376;
	Sun, 12 May 2013 18:31:34 -0700 (PDT)
Received: by 10.66.167.166 with HTTP; Sun, 12 May 2013 18:31:34 -0700 (PDT)
In-Reply-To: <1367931368-21504-7-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1367931368-21504-7-git-send-email-richard.purdie@linuxfoundation.org>
Date: Mon, 13 May 2013 11:31:34 +1000
Message-ID: <CANwerB24+4r2199tp8fz70_P0yPjkKGCZvXkSsobO4Q_6xu6cw@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/15] bin/bitbake: Ensure early errors are shown to the user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 01:49:57 -0000
Content-Type: multipart/alternative; boundary=047d7b10cc5922cfad04dc8f7ab0

--047d7b10cc5922cfad04dc8f7ab0
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 22:55, Richard Purdie <richard.purdie@linuxfoundation.org>wrote:

> Currently if errors occur early in the init process, the errors may
> not be shown to the user. This change ensures that if a failure does
> occur, the messages are flushed from the queue and shown to the user.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  bitbake/bin/bitbake |   21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
> index 0e69207..e05ff5b 100755
> --- a/bitbake/bin/bitbake
> +++ b/bitbake/bin/bitbake
> @@ -240,11 +240,22 @@ Default BBFILES are the .bb files in the current
> directory.""")
>
>      idle = server.getServerIdleCB()
>
> -    cooker = bb.cooker.BBCooker(configuration, idle, initialenv)
> -    cooker.parseCommandLine()
> -
> -    server.addcooker(cooker)
> -    server.saveConnectionDetails()
> +    try:
> +        cooker = bb.cooker.BBCooker(configuration, idle, initialenv)
> +        cooker.parseCommandLine()
> +
> +        server.addcooker(cooker)
> +        server.saveConnectionDetails()
> +    except:
> +        while True:
> +            import queue
>
import queue is Python 3. It is import Queue in Python 2.
If I run bitbake when it is already running, I get:

ImportError: No module named queue
ERROR: Only one copy of bitbake should be run against a build directory


> +            try:
> +                event = server.event_queue.get(block=False)
> +            except (queue.Empty, IOError):
> +                break
> +            if isinstance(event, logging.LogRecord):
> +                logger.handle(event)
> +        raise
>      server.detach()
>
>      # Should no longer need to ever reference cooker
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Regards,
Jonathan

--047d7b10cc5922cfad04dc8f7ab0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 May 2013 22:55, Richard Purdie <span dir=3D"ltr">&lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ric=
hard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><div class=3D"gmai=
l_extra">
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">Currently if errors occur early=
 in the init process, the errors may<br>

not be shown to the user. This change ensures that if a failure does<br>
occur, the messages are flushed from the queue and shown to the user.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0bitbake/bin/bitbake | =C2=A0 21 ++++++++++++++++-----<br>
=C2=A01 file changed, 16 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake<br>
index 0e69207..e05ff5b 100755<br>
--- a/bitbake/bin/bitbake<br>
+++ b/bitbake/bin/bitbake<br>
@@ -240,11 +240,22 @@ Default BBFILES are the .bb files in the current dire=
ctory.&quot;&quot;&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0idle =3D server.getServerIdleCB()<br>
<br>
- =C2=A0 =C2=A0cooker =3D bb.cooker.BBCooker(configuration, idle, initialen=
v)<br>
- =C2=A0 =C2=A0cooker.parseCommandLine()<br>
-<br>
- =C2=A0 =C2=A0server.addcooker(cooker)<br>
- =C2=A0 =C2=A0server.saveConnectionDetails()<br>
+ =C2=A0 =C2=A0try:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0cooker =3D bb.cooker.BBCooker(configuration, i=
dle, initialenv)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0cooker.parseCommandLine()<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0server.addcooker(cooker)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0server.saveConnectionDetails()<br>
+ =C2=A0 =C2=A0except:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0while True:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import queue<br></blockquote><di=
v style>import queue is Python 3. It is import Queue in Python 2.</div><div=
 style>If I run bitbake when it is already running, I get:</div><div style>=
<br></div><div style>ImportError: No module named queue</div>
<div style><div>ERROR: Only one copy of bitbake should be run against a bui=
ld directory</div><div>=C2=A0<br></div></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D server.e=
vent_queue.get(block=3DFalse)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except (queue.Empty, IOError):<b=
r>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(event, logging.Log=
Record):<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.handle(even=
t)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0raise<br>
=C2=A0 =C2=A0 =C2=A0server.detach()<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Should no longer need to ever reference cooker<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra" style=
>Regards,</div><div class=3D"gmail_extra" style>Jonathan</div></div>

--047d7b10cc5922cfad04dc8f7ab0--
