Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web09.12602.1603473944713456576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 10:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bIMT+JkY;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id t25so3391253ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 10:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osBccEp1cinB/pcZmle7rcx9AOqWcO0+QziqruablTs=;
        b=bIMT+JkYctMseYN63EW6uegJjdypyqQVz+6xnxKKgTpSl24VsrUh3L8jem6x46G2OZ
         Nub7hIJBo3SVdFaKq+EWxpB009a0f8vsVAHLaZlbqUgsWRugM16uFoneJcNgD9EgY9TL
         WLxRMHJOp/8aOPUtTJaXPgyuHJRMASCGroZHi3Dr+2vohCYa/8m201S65nMk642cEYzy
         uMs7DNTCpVP/j2C7zH9Kbh+URHLgOsKydzeF1AiK9m3T9ogVI4zc69xc/hIqb+uaje8d
         MBj7JCNJMKisAe4qykqsmJyUI+QpU7/+CNyKLe83R5Rbw5IFExlbwu2MAABlD8TP2wPC
         KbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osBccEp1cinB/pcZmle7rcx9AOqWcO0+QziqruablTs=;
        b=Qsj4OilR2ecQize+2zryDo8CtKBBQ++F76UdK1DONs6EMoWNai6k6W1mgVea0WbFix
         kPI2V57YQYgF7UPn8i9gWZF0c3ZKO+Xcv8pUcbNKqDjOmwD3F6CWafn7Lb9Kyfu/Wic+
         FW7VzPTeamvhXDJ1x6TY3x8ZOSRGUIN6P8gN5Si+XJlKHyeCQAA1poqCXbH7HjqZ6m1S
         2/rwam9qrHdB2vl90DCSui8atHhPwhejULfx30G+iiALZwhnDLHpR6eQd0FO2RUm4g7O
         SurDU5neNU8UoCHbLftcUtE4XD+Tv0WJnwp6Jj99I9GI6MUHIGKT7MG4b3EgFfnU5KpX
         ay4A==
X-Gm-Message-State: AOAM533FLIg/7d5Gh2lU6Jv8EoSd9YO/G93CWGX1AhIGHKatHklOwIbB
	8v4IlSPiVRu4orZpUSs8UH9CcTaUTDZzqAzSftQ=
X-Google-Smtp-Source: ABdhPJyUwljsB5LCIdWdH5r5YawuIsgP0vhh23EHyK8KuoE176IZiVVd4s9nsiuK9G4r1HEJnfZX49RzfzjkskdVWpA=
X-Received: by 2002:a17:906:d292:: with SMTP id ay18mr3139904ejb.244.1603473943187;
 Fri, 23 Oct 2020 10:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201023165648.5515-1-sakib.sajal@windriver.com> <20201023165648.5515-2-sakib.sajal@windriver.com>
In-Reply-To: <20201023165648.5515-2-sakib.sajal@windriver.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Fri, 23 Oct 2020 10:25:31 -0700
Message-ID: <CABcZANnFfhA5T+7Z_BgVsPZb0KDQ4gtmQK5e2BtbQ9wVRfyQVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] buildstats.bbclass: add functionality to collect build system stats
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca574205b259dec7"

--000000000000ca574205b259dec7
Content-Type: text/plain; charset="UTF-8"

Testing for isfile() and +x will mean you can't run commands via the PATH
via that commands variable, only full absolute paths. is that really the
intention? It's inconsistent with every other such variable, and also means
you can't define bitbake functions to be run instead.

On Fri, Oct 23, 2020 at 9:57 AM Sakib Sajal <sakib.sajal@windriver.com>
wrote:

> There are a number of timeout and hang defects where
> it would be useful to collect statistics about what
> is running on a build host when that condition occurs.
>
> This adds functionality to collect build system stats
> on a regular interval and/or on task failure. Both
> features are disabled by default.
>
> To enable logging on a regular interval, set:
> BB_HEARTBEAT_EVENT = "<interval>"
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats
>
> To enable logging on a task failure, set:
> BB_LOG_HOST_STAT_ON_FAILURE = "1"
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats
>
> The list of commands, along with the desired options, need
> to be specified in the BB_LOG_HOST_STAT_CMDS variable
> delimited by ; as such:
> BB_LOG_HOST_STAT_CMDS = "/<absolute>/<path>/<executable> <options> ; ... ;"
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/classes/buildstats.bbclass | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/buildstats.bbclass
> b/meta/classes/buildstats.bbclass
> index 6f87187233..c68d7bb8a2 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -104,14 +104,38 @@ def write_task_data(status, logfile, e, d):
>              f.write("Status: FAILED \n")
>          f.write("Ended: %0.2f \n" % e.time)
>
> +def write_host_data(logfile, e, d):
> +    import subprocess, os, datetime
> +    cmds = d.getVar('BB_LOG_HOST_STAT_CMDS').split(";")
> +    with open(logfile, "a") as f:
> +        f.write("Event Time: %f\nDate: %s\n" % (e.time,
> datetime.datetime.now()))
> +        for cmd in cmds:
> +            if len(cmd) == 0:
> +                continue
> +            c = cmd.split()
> +            if os.path.isfile(c[0]) and os.access(c[0], os.X_OK):
> +                try:
> +                    output = subprocess.check_output(c,
> stderr=subprocess.STDOUT).decode('utf-8')
> +                except subprocess.CalledProcessError as err:
> +                    output = "Error running command: %s\n%s" % (cmd, err)
> +                f.write("%s\n%s\n" % (cmd, output))
> +            else:
> +                f.write("Error running command: '%s': %s is not an
> executable.\n" % (cmd, c[0]))
> +
>  python run_buildstats () {
>      import bb.build
>      import bb.event
>      import time, subprocess, platform
>
>      bn = d.getVar('BUILDNAME')
> -    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
> -    taskdir = os.path.join(bsdir, d.getVar('PF'))
> +    # bitbake fires HeartbeatEvent even before a build has been
> +    # triggered, causing BUILDNAME to be None
> +    if bn is not None:
> +        bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
> +        taskdir = os.path.join(bsdir, d.getVar('PF'))
> +        if isinstance(e, bb.event.HeartbeatEvent):
> +            bb.utils.mkdirhier(bsdir)
> +            write_host_data(os.path.join(bsdir, "host_stats"), e, d)
>
>      if isinstance(e, bb.event.BuildStarted):
>
>  ########################################################################
> @@ -186,10 +210,12 @@ python run_buildstats () {
>          build_status = os.path.join(bsdir, "build_stats")
>          with open(build_status, "a") as f:
>              f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
> +            if
> bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")):
> +                write_host_data(build_status, e, d)
>  }
>
>  addhandler run_buildstats
> -run_buildstats[eventmask] = "bb.event.BuildStarted
> bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded
> bb.build.TaskFailed"
> +run_buildstats[eventmask] = "bb.event.BuildStarted
> bb.event.BuildCompleted bb.event.HeartbeatEvent bb.build.TaskStarted
> bb.build.TaskSucceeded bb.build.TaskFailed"
>
>  python runqueue_stats () {
>      import buildstats
> --
> 2.27.0
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000ca574205b259dec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Testing for isfile() and=C2=A0+x will mean you can&#39;t r=
un commands via the PATH via that commands variable, only full absolute pat=
hs. is that really the intention? It&#39;s inconsistent with every other su=
ch variable, and also means you can&#39;t define bitbake functions to be ru=
n instead.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Oct 23, 2020 at 9:57 AM Sakib Sajal &lt;<a href=3D"mailto=
:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">There are a number of =
timeout and hang defects where<br>
it would be useful to collect statistics about what<br>
is running on a build host when that condition occurs.<br>
<br>
This adds functionality to collect build system stats<br>
on a regular interval and/or on task failure. Both<br>
features are disabled by default.<br>
<br>
To enable logging on a regular interval, set:<br>
BB_HEARTBEAT_EVENT =3D &quot;&lt;interval&gt;&quot;<br>
Logs are stored in ${BUILDSTATS_BASE}/&lt;build_name&gt;/host_stats<br>
<br>
To enable logging on a task failure, set:<br>
BB_LOG_HOST_STAT_ON_FAILURE =3D &quot;1&quot;<br>
Logs are stored in ${BUILDSTATS_BASE}/&lt;build_name&gt;/build_stats<br>
<br>
The list of commands, along with the desired options, need<br>
to be specified in the BB_LOG_HOST_STAT_CMDS variable<br>
delimited by ; as such:<br>
BB_LOG_HOST_STAT_CMDS =3D &quot;/&lt;absolute&gt;/&lt;path&gt;/&lt;executa=
ble&gt; &lt;options&gt; ; ... ;&quot;<br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com=
" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/buildstats.bbclass | 32 +++++++++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 29 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbc=
lass<br>
index 6f87187233..c68d7bb8a2 100644<br>
--- a/meta/classes/buildstats.bbclass<br>
+++ b/meta/classes/buildstats.bbclass<br>
@@ -104,14 +104,38 @@ def write_task_data(status, logfile, e, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;Status: FAIL=
ED \n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;Ended: %0.2f \n&quot; % e.=
time)<br>
<br>
+def write_host_data(logfile, e, d):<br>
+=C2=A0 =C2=A0 import subprocess, os, datetime<br>
+=C2=A0 =C2=A0 cmds =3D d.getVar(&#39;BB_LOG_HOST_STAT_CMDS&#39;).split(&q=
uot;;&quot;)<br>
+=C2=A0 =C2=A0 with open(logfile, &quot;a&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;Event Time: %f\nDate: %s\n&quot=
; % (e.time, datetime.datetime.now()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cmd in cmds:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(cmd) =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D cmd.split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(c[0]) and os.=
access(c[0], os.X_OK):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out=
put =3D subprocess.check_output(c, stderr=3Dsubprocess.STDOUT).decode(&#39;=
utf-8&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess=
.CalledProcessError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out=
put =3D &quot;Error running command: %s\n%s&quot; % (cmd, err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s\=
n%s\n&quot; % (cmd, output))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;Err=
or running command: &#39;%s&#39;: %s is not an executable.\n&quot; % (cmd, =
c[0]))<br>
+<br>
=C2=A0python run_buildstats () {<br>
=C2=A0 =C2=A0 =C2=A0import bb.build<br>
=C2=A0 =C2=A0 =C2=A0import bb.event<br>
=C2=A0 =C2=A0 =C2=A0import time, subprocess, platform<br>
<br>
=C2=A0 =C2=A0 =C2=A0bn =3D d.getVar(&#39;BUILDNAME&#39;)<br>
-=C2=A0 =C2=A0 bsdir =3D os.path.join(d.getVar(&#39;BUILDSTATS_BASE&#39;),=
 bn)<br>
-=C2=A0 =C2=A0 taskdir =3D os.path.join(bsdir, d.getVar(&#39;PF&#39;))<br>
+=C2=A0 =C2=A0 # bitbake fires HeartbeatEvent even before a build has been=
<br>
+=C2=A0 =C2=A0 # triggered, causing BUILDNAME to be None<br>
+=C2=A0 =C2=A0 if bn is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bsdir =3D os.path.join(d.getVar(&#39;BUILDSTA=
TS_BASE&#39;), bn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 taskdir =3D os.path.join(bsdir, d.getVar(&#39=
;PF&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(e, bb.event.HeartbeatEvent):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(bsdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_host_data(os.path.join(bs=
dir, &quot;host_stats&quot;), e, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if isinstance(e, bb.event.BuildStarted):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0########################################=
################################<br>
@@ -186,10 +210,12 @@ python run_buildstats () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_status =3D os.path.join(bsdir, &qu=
ot;build_stats&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(build_status, &quot;a&quot;) a=
s f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(d.expand(&quot;Fai=
led at: ${PF} at task: %s \n&quot; % e.task))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.to_boolean(d.getVar=
(&quot;BB_LOG_HOST_STAT_ON_FAILURE&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_host_data(b=
uild_status, e, d)<br>
=C2=A0}<br>
<br>
=C2=A0addhandler run_buildstats<br>
-run_buildstats[eventmask] =3D &quot;bb.event.BuildStarted bb.event.BuildC=
ompleted bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed&qu=
ot;<br>
+run_buildstats[eventmask] =3D &quot;bb.event.BuildStarted bb.event.BuildC=
ompleted bb.event.HeartbeatEvent bb.build.TaskStarted bb.build.TaskSucceede=
d bb.build.TaskFailed&quot;<br>
<br>
=C2=A0python runqueue_stats () {<br>
=C2=A0 =C2=A0 =C2=A0import buildstats<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000ca574205b259dec7--
