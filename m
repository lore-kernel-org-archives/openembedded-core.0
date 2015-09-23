Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 408887404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 20:25:59 +0000 (UTC)
Received: by iofh134 with SMTP id h134so55320555iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LzfL3jsCwyakWLVuhTyudJzxL8AOv+x0wFpv86qgc2s=;
	b=MP+CYT6QXv3dvngTLQ0tl5nGKlaME+t9HvyVgmnMcoWmkVPm1F9shaLwLwvmU+Tx4+
	fw3rdug4NyYJKZ+t2sMvsH23QngyD6lSta2HpGIYRQtjwx6D7V1RFsmlaI/M8COufzii
	yWHLLnBsO8GciOjgewEpGdTchw1uxdghbSP6/01S4McEaJHTc0UgFT4Q2Ph01eMpK8Ut
	eVf1IbWLvjLY6KRR+eaNpHbizOdEI1g2ElKI3aoV0KjnJcFx7dK4zKGwPS0JZY9sbH8w
	eARa+bSY6TWBO4uULpf0FYDWg7YqpcuPMtTbLuqNqOi3GQCGbzOMeioVWSFK4ipcB0+k
	vCWQ==
X-Received: by 10.107.40.201 with SMTP id o192mr28901916ioo.83.1443039959348; 
	Wed, 23 Sep 2015 13:25:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Wed, 23 Sep 2015 13:25:39 -0700 (PDT)
In-Reply-To: <1443024836-20974-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
	<1443024836-20974-1-git-send-email-Martin.Jansa@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Sep 2015 13:25:39 -0700
X-Google-Sender-Auth: G9OWJwBnhyW-gBgMO0S7MqdZFkg
Message-ID: <CABcZANmQ2724keoeYcO1-3bgpo==9xh6x_4zXNqnZ43FgW24ug@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: show warning when chmod fails
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
X-List-Received-Date: Wed, 23 Sep 2015 20:26:01 -0000
Content-Type: multipart/alternative; boundary=001a1141f4102c87d405206fec04

--001a1141f4102c87d405206fec04
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 9:13 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Alex Franco <alejandro.franco@linux.intel.com>
>
> * for some reason this part of:
>   http://patchwork.openembedded.org/patch/102561/
>   wasn't ever merged.
>
> [YOCTO #7669]
>
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 2eb744f..34f8618 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -839,9 +839,12 @@ def check_sanity_everybuild(status, d):
>      else:
>          bb.utils.mkdirhier(tmpdir)
>          # Remove setuid, setgid and sticky bits from TMPDIR
> -        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
> -        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
> -        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
> +        try:
> +            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
> +            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
> +            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
> +        except OSError:
> +            bb.warn("Unable to chmod TMPDIR: %s" % tmpdir)
>

I'd suggest showing the actual error, here. E.g. "Unable to chmod TMPDIR:
%s" % exc. (The error message from the exception usually includes the path
on disk already, so probably don't need both tmpdir and exc).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141f4102c87d405206fec04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 23, 2015 at 9:13 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":26h" c=
lass=3D"a3s" style=3D"overflow:hidden">From: Alex Franco &lt;<a href=3D"mai=
lto:alejandro.franco@linux.intel.com">alejandro.franco@linux.intel.com</a>&=
gt;<br>
<br>
* for some reason this part of:<br>
=C2=A0 <a href=3D"http://patchwork.openembedded.org/patch/102561/" rel=3D"n=
oreferrer" target=3D"_blank">http://patchwork.openembedded.org/patch/102561=
/</a><br>
=C2=A0 wasn&#39;t ever merged.<br>
<br>
[YOCTO #7669]<br>
<br>
Signed-off-by: Alex Franco &lt;<a href=3D"mailto:alejandro.franco@linux.int=
el.com">alejandro.franco@linux.intel.com</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 2eb744f..34f8618 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -839,9 +839,12 @@ def check_sanity_everybuild(status, d):<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(tmpdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove setuid, setgid and sticky bits f=
rom TMPDIR<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpdir, os.stat(tmpdir).st_mode &amp;=
 ~ stat.S_ISUID)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpdir, os.stat(tmpdir).st_mode &amp;=
 ~ stat.S_ISGID)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpdir, os.stat(tmpdir).st_mode &amp;=
 ~ stat.S_ISVTX)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpdir, os.stat(tmpdir)=
.st_mode &amp; ~ stat.S_ISUID)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpdir, os.stat(tmpdir)=
.st_mode &amp; ~ stat.S_ISGID)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpdir, os.stat(tmpdir)=
.st_mode &amp; ~ stat.S_ISVTX)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to chmod TM=
PDIR: %s&quot; % tmpdir)</div></blockquote></div><br>I&#39;d suggest showin=
g the actual error, here. E.g. &quot;Unable to chmod TMPDIR: %s&quot; % exc=
. (The error message from the exception usually includes the path on disk a=
lready, so probably don&#39;t need both tmpdir and exc).<br>-- <br><div cla=
ss=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div>
</div></div>

--001a1141f4102c87d405206fec04--
