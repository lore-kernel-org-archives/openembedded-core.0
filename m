Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0F31774242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 20:14:02 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so9771331qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 13:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+k6CiLH2ZOEhpuCAIYbrEtvGmEkiX/EjsF56rgp8cfA=;
	b=GJT0L8RHGKN9+tF+BT7bOw3YXarloEnyrACuDX76aLnQewprhxT9NmD5/871cnopEb
	QLdgLuRSkz5k+oepcm+y/D1BFvWiPOUP6K2Gcdm4RHbFgqDvntp64LfusS+H9iB5EwUU
	SoWQzihqYXiNgVHgCUiN/qzny+0IpZ4xjyiNr+3ASYMPNPgHJ1L929ItzZHXO5/gudhH
	12qVluht3HN5UlMgRFsuBYhdSiuBBxEX9uZw6WWIsE52Y3aIUVif9kI6RacNEpbSYLaA
	CS8FwOYrny/6GFnaxmIGbzGg6cs07+sgoZdFxvRxa2QYbp/sOBXChKKlaTJa4zidb/MR
	56EA==
X-Gm-Message-State: ALoCoQk7bmYEAwSiR4vs1w8bercp9/7P0TFEKZqCDAhxdUVCEGuUEtZEDvMDxDNxG4sClVAg7gJv
X-Received: by 10.55.221.199 with SMTP id u68mr45967071qku.83.1441829642548;
	Wed, 09 Sep 2015 13:14:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 9 Sep 2015 13:13:43 -0700 (PDT)
In-Reply-To: <CAMKF1soBdYHWVPKHhgN8GR02xn=0CEPZTUB_Njft3YtG+UMkbA@mail.gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<CAMKF1soBdYHWVPKHhgN8GR02xn=0CEPZTUB_Njft3YtG+UMkbA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Sep 2015 21:13:43 +0100
Message-ID: <CAJTo0LYxj2FqssLqdXrK6Y0MEFbMghHMpraYVFp5LDPPGVSy8A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Wed, 09 Sep 2015 20:14:05 -0000
Content-Type: multipart/alternative; boundary=001a11499758abe9c2051f561fc9

--001a11499758abe9c2051f561fc9
Content-Type: text/plain; charset=UTF-8

On 8 September 2015 at 19:09, Khem Raj <raj.khem@gmail.com> wrote:

> this patch fixed it during autoruns, but date test is common for
> sysvint and systemd it ignores the outputs of systemctl cmds
> so in theory it will work on both sysvinit and systemd. Although its not
> elegant
>
> diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
> index 97e8ee4..f73ad1c 100644
> --- a/meta/lib/oeqa/runtime/date.py
> +++ b/meta/lib/oeqa/runtime/date.py
> @@ -7,6 +7,7 @@ class DateTest(oeRuntimeTest):
>     @testcase(211)
>     @skipUnlessPassed("test_ssh")
>     def test_date(self):
> +        (status, output) = self.target.run('systemctl stop
> systemd-timesyncd')
>         (status, output) = self.target.run('date +"%Y-%m-%d %T"')
>         self.assertEqual(status, 0, msg="Failed to get initial date,
> output: %s" % output)
>         oldDate = output
> @@ -21,3 +22,4 @@ class DateTest(oeRuntimeTest):
>
>         (status, output) = self.target.run('date -s "%s"' % oldDate)
>         self.assertEqual(status, 0, msg="Failed to reset date, output:
> %s" % output)
> +        (status, output) = self.target.run('systemctl start
> systemd-timesyncd')
>

Thanks for looking at this, I've rewritten this to use setup/teardown
methods and check that systemd is being used and will send the patch
shortly.

Ross

--001a11499758abe9c2051f561fc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2015 at 19:09, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vr" class=3D"a3s" st=
yle=3D"overflow:hidden">this patch fixed it during autoruns, but date test =
is common for<br>
sysvint and systemd it ignores the outputs of systemctl cmds<br>
so in theory it will work on both sysvinit and systemd. Although its not el=
egant<br>
<br>
diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py<=
br>
index 97e8ee4..f73ad1c 100644<br>
--- a/meta/lib/oeqa/runtime/date.py<br>
+++ b/meta/lib/oeqa/runtime/date.py<br>
@@ -7,6 +7,7 @@ class DateTest(oeRuntimeTest):<br>
=C2=A0 =C2=A0 @testcase(211)<br>
=C2=A0 =C2=A0 @skipUnlessPassed(&quot;test_ssh&quot;)<br>
=C2=A0 =C2=A0 def test_date(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;syst=
emctl stop systemd-timesyncd&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;date =
+&quot;%Y-%m-%d %T&quot;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3D&quot;Failed =
to get initial date,<br>
output: %s&quot; % output)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldDate =3D output<br>
@@ -21,3 +22,4 @@ class DateTest(oeRuntimeTest):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;date =
-s &quot;%s&quot;&#39; % oldDate)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3D&quot;Failed =
to reset date, output:<br>
%s&quot; % output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;syst=
emctl start systemd-timesyncd&#39;)</div></blockquote></div><br>Thanks for =
looking at this, I&#39;ve rewritten this to use setup/teardown methods and =
check that systemd is being used and will send the patch shortly.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a11499758abe9c2051f561fc9--
