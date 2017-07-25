Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D4DC078313
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 10:18:18 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l7so54043422iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 03:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tahpQyH6pDvjFCTOl29n/yzKowRIFJRR1mXnOumubOw=;
	b=r5n5O5DRU36QpZCNBnjuTDDAO0Mf5wBHMUX1popl55xaph5a4UIAJ6+mI1TSZKwpKZ
	pjfQ97X9cv5DYIlTPxP1Lbi34ecOnFo/oQ93ppDpX7sHiSqgWQVfxU2RXIwRq1o+L8WK
	GeW3EhQHi9MY20A/5/njoaQTBfbzNWirABu32TqNwNURS84hMoMFvYHKC6o2aIbELhuk
	s+xJzV53cBcEUyphNhnTQvDmYb/B1T8GQScedr4M1pD0Q0gdpJGxej8z0f0oFgQVwEn8
	MTuSzArs+/G6zN9eGqpre2aMuUFbJFTflOk7G9qnWMPWaeHxK6Zxn/oAqK/nfLVmZf09
	9Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tahpQyH6pDvjFCTOl29n/yzKowRIFJRR1mXnOumubOw=;
	b=AyzXOK5VLmbBqk9H5pZnSdZzDvXdhAUDQp5GojmjiksP+rSjuub1bTrSJBnt9Pq2qr
	1HmUhjoIX5yKPG27IhiwSWRCWTYPeNkYvbSjwXNia6j6JSkG/parnHscCKln+x7hkP6c
	stdL0+TomCi/0TjFD7h9NzQXyujvabHuPu9fFJyxEv955izMdOf35JbuivKA5EDvAmgp
	ZNZjlnJXb1OD9P4daUEvAeBJxynD2uXfgMiHawU8AGroQo1CK4AI5jPWb9NoBetPSXS0
	Pl8LzQ/veYuFedG9OU5c/KPddmTj7fpjNOZABNjmZznBkhg+vbD74zVpmZ3YsXYs8N8P
	ILkQ==
X-Gm-Message-State: AIVw112MGJtxjvkxVGiVLKNRf9BixIVnhzHq9rcKZxKQUey9dIbEZoy2
	uaPBfVTsHCXq+hlfty0HnWzukBghloOK
X-Received: by 10.107.205.72 with SMTP id d69mr4120970iog.224.1500977899822;
	Tue, 25 Jul 2017 03:18:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 25 Jul 2017 03:17:59 -0700 (PDT)
In-Reply-To: <20170725101719.2172-3-ross.burton@intel.com>
References: <20170725101719.2172-1-ross.burton@intel.com>
	<20170725101719.2172-3-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Jul 2017 11:17:59 +0100
Message-ID: <CAJTo0Lam_-z9ARVPAMCw9kF2rGKwvY7iv3QnwqfrLzBVFf-qgw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] fetch/wget: mitigate a wget race condition when listing FTP directories
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
X-List-Received-Date: Tue, 25 Jul 2017 10:18:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c189bae8909e5055521a636"

--94eb2c189bae8909e5055521a636
Content-Type: text/plain; charset="UTF-8"

Wrong list, sorry.

Ross

On 25 July 2017 at 11:17, Ross Burton <ross.burton@intel.com> wrote:

> When wget is fetching a listing for a directory over FTP it writes to a
> temporary file called .listing in the current directory.  If there are
> many such
> operations happening in parallel - for example during 'bitbake world -c
> checkpkg' - then up to BB_NUMBER_THREADS instances of wget will be racing
> to
> write to, read, and delete the same file.
>
> This results in various failures such as the file disappearing before wget
> has
> processed it or the file changing contents, which causes checkpkg to
> randomly
> fail.
>
> Mitigate the race condition by creating a temporary directory to run wget
> in
> when doing directory listings.
>
> [ YOCTO #11828 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  bitbake/lib/bb/fetch2/wget.py | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
> index 208ee9bdd69..8ee9769d39b 100644
> --- a/bitbake/lib/bb/fetch2/wget.py
> +++ b/bitbake/lib/bb/fetch2/wget.py
> @@ -90,13 +90,13 @@ class Wget(FetchMethod):
>
>          self.basecmd = d.getVar("FETCHCMD_wget") or "/usr/bin/env wget -t
> 2 -T 30 --passive-ftp --no-check-certificate"
>
> -    def _runwget(self, ud, d, command, quiet):
> +    def _runwget(self, ud, d, command, quiet, workdir=None):
>
>          progresshandler = WgetProgressHandler(d)
>
>          logger.debug(2, "Fetching %s using command '%s'" % (ud.url,
> command))
>          bb.fetch2.check_network_access(d, command, ud.url)
> -        runfetchcmd(command + ' --progress=dot -v', d, quiet,
> log=progresshandler)
> +        runfetchcmd(command + ' --progress=dot -v', d, quiet,
> log=progresshandler, workdir=workdir)
>
>      def download(self, ud, d):
>          """Fetch urls"""
> @@ -422,17 +422,16 @@ class Wget(FetchMethod):
>          Run fetch checkstatus to get directory information
>          """
>          f = tempfile.NamedTemporaryFile()
> +        with tempfile.TemporaryDirectory(prefix="wget-index-") as
> workdir, tempfile.NamedTemporaryFile(dir=workdir, prefix="wget-listing-")
> as f:
> +            agent = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12)
> Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12"
> +            fetchcmd = self.basecmd
> +            fetchcmd += " -O " + f.name + " --user-agent='" + agent + "'
> '" + uri + "'"
> +            try:
> +                self._runwget(ud, d, fetchcmd, True, workdir=workdir)
> +                fetchresult = f.read()
> +            except bb.fetch2.BBFetchException:
> +                fetchresult = ""
>
> -        agent = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12)
> Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12"
> -        fetchcmd = self.basecmd
> -        fetchcmd += " -O " + f.name + " --user-agent='" + agent + "' '"
> + uri + "'"
> -        try:
> -            self._runwget(ud, d, fetchcmd, True)
> -            fetchresult = f.read()
> -        except bb.fetch2.BBFetchException:
> -            fetchresult = ""
> -
> -        f.close()
>          return fetchresult
>
>      def _check_latest_version(self, url, package, package_regex,
> current_version, ud, d):
> --
> 2.11.0
>
>

--94eb2c189bae8909e5055521a636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong list, sorry.<div><br></div><div>Ross</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 25 July 2017 at 11=
:17, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.=
com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">When wget is fetching a listing for a directory o=
ver FTP it writes to a<br>
temporary file called .listing in the current directory.=C2=A0 If there are=
 many such<br>
operations happening in parallel - for example during &#39;bitbake world -c=
<br>
checkpkg&#39; - then up to BB_NUMBER_THREADS instances of wget will be raci=
ng to<br>
write to, read, and delete the same file.<br>
<br>
This results in various failures such as the file disappearing before wget =
has<br>
processed it or the file changing contents, which causes checkpkg to random=
ly<br>
fail.<br>
<br>
Mitigate the race condition by creating a temporary directory to run wget i=
n<br>
when doing directory listings.<br>
<br>
[ YOCTO #11828 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/fetch2/wget.py | 23 +++++++++++------------<br>
=C2=A01 file changed, 11 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/bitbake/lib/bb/fetch2/wget.<wbr>py b/bitbake/lib/bb/fetch2/wge=
t.<wbr>py<br>
index 208ee9bdd69..8ee9769d39b 100644<br>
--- a/bitbake/lib/bb/fetch2/wget.<wbr>py<br>
+++ b/bitbake/lib/bb/fetch2/wget.<wbr>py<br>
@@ -90,13 +90,13 @@ class Wget(FetchMethod):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.basecmd =3D d.getVar(&quot;FETCHCMD_=
wget&quot;) or &quot;/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-=
certificate&quot;<br>
<br>
-=C2=A0 =C2=A0 def _runwget(self, ud, d, command, quiet):<br>
+=C2=A0 =C2=A0 def _runwget(self, ud, d, command, quiet, workdir=3DNone):<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0progresshandler =3D WgetProgressHandler(d=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(2, &quot;Fetching %s using c=
ommand &#39;%s&#39;&quot; % (ud.url, command))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fetch2.check_network_<wbr>access(d, co=
mmand, ud.url)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 runfetchcmd(command + &#39; --progress=3Ddot -=
v&#39;, d, quiet, log=3Dprogresshandler)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runfetchcmd(command + &#39; --progress=3Ddot -=
v&#39;, d, quiet, log=3Dprogresshandler, workdir=3Dworkdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def download(self, ud, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Fetch urls&quot;&quot;&=
quot;<br>
@@ -422,17 +422,16 @@ class Wget(FetchMethod):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run fetch checkstatus to get directory in=
formation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D tempfile.NamedTemporaryFile()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tempfile.TemporaryDirectory(<wbr>prefix=
=3D&quot;wget-index-&quot;) as workdir, tempfile.NamedTemporaryFile(<wbr>di=
r=3Dworkdir, prefix=3D&quot;wget-listing-&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 agent =3D &quot;Mozilla/5.0 (X11=
; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Fi=
refox/3.6.12&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchcmd =3D self.basecmd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchcmd +=3D &quot; -O &quot; +=
 <a href=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a> =
+ &quot; --user-agent=3D&#39;&quot; + agent + &quot;&#39; &#39;&quot; + uri=
 + &quot;&#39;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._runwget(ud, =
d, fetchcmd, True, workdir=3Dworkdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchresult =3D f.=
read()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.fetch2.BBFetchExceptio=
n:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchresult =3D &q=
uot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 agent =3D &quot;Mozilla/5.0 (X11; U; Linux i68=
6; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchcmd =3D self.basecmd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchcmd +=3D &quot; -O &quot; + <a href=3D"ht=
tp://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a> + &quot; --use=
r-agent=3D&#39;&quot; + agent + &quot;&#39; &#39;&quot; + uri + &quot;&#39;=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._runwget(ud, d, fetchcmd, T=
rue)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchresult =3D f.read()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.fetch2.BBFetchException:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchresult =3D &quot;&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fetchresult<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _check_latest_version(self, url, package, package_r=
egex, current_version, ud, d):<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c189bae8909e5055521a636--
