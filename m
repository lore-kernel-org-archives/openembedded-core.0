Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id E4AC96067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 11:44:48 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id b5so809113itc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 03:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uL/9bPxtYuZu8z4bR7RbyNA0/FdoC4s9TfPsklOM7T0=;
	b=1csCcCsjejmEe4FsvqRCSUQIi8vmY/zQcjdluh9sZFj4R8Me++a+EvvJJHI163J2ud
	daME2ZiGpHoRViO/Gp8q/voq6ax3vS4hRSmL29RadNmzDfoIEdPzH1amAASQw3TXna0h
	TJiP0Xb1wkQ7ykg7JURCFYb75VMgBp0rX+NcneuESsUYRbCQkheogqaN5xMvJHgGnxDt
	b6Ml5ABkZQFC/CKi7IqH3yVBuIIRA3jqEA6oC9cLaRVLf3XsGzwtcHprKAR5GuaJTeLp
	o0x4yEKWnGue8Y29as1EHlCP3Buf3yzkIMAsgXAF/bpqpGLDNA8L0yQurMDa54X/RW3f
	0CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uL/9bPxtYuZu8z4bR7RbyNA0/FdoC4s9TfPsklOM7T0=;
	b=iLsxnrUPbrKVvQ9TF7RsADY099M70q/ZJQ2eX9uEu7wPEf+AUtcHy1QmR9YTIH3gLp
	HQDo1VoHcDXclvXWJKfufYV6iySNO4kMdxdBmjX+/nur+L/tzM3X5YUw181+QmNWrLd5
	ofk/5shzXp59Pai4RsMdqFt2eTZozs/LZR3khkSpyFYrDzs7lsrKo/tn1SRrymRM9hO6
	Dk4GYqWtJR4oR5auLnO7xubBpm6NHj6Nl3i7Mweop/tcf/nCYfrfY6xNHRTibUDlbN5T
	pYto9jgHU4ji9Awi/g9SWNO2lULHBjF1PbsGQKifqv/09OjIqPYh0DOAryzwp4Q9mCzI
	hMgw==
X-Gm-Message-State: AJaThX6qw5FJymfXXqKFznh/KK2tcCSwy1BuEBph+xRUvlwOJZdJjleO
	8NtnXCdB4ACSVRzGiPAwQfyvjvV1aVnh4kw3Mzl6IQ==
X-Google-Smtp-Source: AGs4zMbQSrIbh1vaZkBDfq/z+dIXHVoTNIxIWlSjVEvJG9YHgUWrdT9wnfnEs+cPoayBSonL9PKfHxGCAarXowBFqnw=
X-Received: by 10.107.47.1 with SMTP id j1mr27781124ioo.217.1512474289922;
	Tue, 05 Dec 2017 03:44:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 5 Dec 2017 03:44:29 -0800 (PST)
In-Reply-To: <1511849598-21661-1-git-send-email-yi.zhao@windriver.com>
References: <1511849598-21661-1-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Dec 2017 11:44:29 +0000
Message-ID: <CAJTo0LY4jzykDKeZtD7Z7qqr1JQz36K97E6dvzr0ZXBGeDEbjg@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icu: fix libicudata corruption on big endian system
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
X-List-Received-Date: Tue, 05 Dec 2017 11:44:49 -0000
Content-Type: multipart/alternative; boundary="001a11377fbcc87a5a055f965c54"

--001a11377fbcc87a5a055f965c54
Content-Type: text/plain; charset="UTF-8"

On 28 November 2017 at 06:13, Yi Zhao <yi.zhao@windriver.com> wrote:

> ICU library libicudata is created with a wrong endianness if the host
> and target have different endianness. (e.g. build ICU for qemuppc on
> x86-64 host)
> See upstream bug report: http://bugs.icu-project.org/trac/ticket/11758
>
> The discussion in oe-core mailing list:
> https://www.mail-archive.com/openembedded-core@lists.
> openembedded.org/msg65155.html
>
> The root cause is the native pkgdata can not generate correct icu data
> for different endianness. By default, this data is built into the shared
> library libicudata that would cause it corrupt. But ICU also provides
> additional options for loading the data. With option
> --with-data-packaging=archive, ICU outputs a single icudt.dat file which
> can be loaded by the library.
> See document: http://userguide.icu-project.org/icudata
>
> So for big endian system, we can use the separated data file which
> re-generates by icupkg and set the correct ICU_DATA environment variable
> to make sure the library can load the data without problems.
>

Fails on various builds on the AB:

icupkg: unable to open input file
"TOPDIR/tmp/work/ppc7400-poky-linux/icu/60.1-r0/icu/source/data/in/icudt59l.dat"

http://errors.yoctoproject.org/Errors/Latest/?filter=%20icu:%20do_install&type=failure

Ross

--001a11377fbcc87a5a055f965c54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 November 2017 at 06:13, Yi Zhao <span dir=3D"ltr">&l=
t;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windri=
ver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">ICU library libicudata is created with a wrong=
 endianness if the host<br>
and target have different endianness. (e.g. build ICU for qemuppc on<br>
x86-64 host)<br>
See upstream bug report: <a href=3D"http://bugs.icu-project.org/trac/ticket=
/11758" rel=3D"noreferrer" target=3D"_blank">http://bugs.icu-project.org/<w=
br>trac/ticket/11758</a><br>
<br>
The discussion in oe-core mailing list:<br>
<a href=3D"https://www.mail-archive.com/openembedded-core@lists.openembedde=
d.org/msg65155.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-=
archive.com/<wbr>openembedded-core@lists.<wbr>openembedded.org/msg65155.htm=
l</a><br>
<br>
The root cause is the native pkgdata can not generate correct icu data<br>
for different endianness. By default, this data is built into the shared<br=
>
library libicudata that would cause it corrupt. But ICU also provides<br>
additional options for loading the data. With option<br>
--with-data-packaging=3Darchive, ICU outputs a single icudt.dat file which<=
br>
can be loaded by the library.<br>
See document: <a href=3D"http://userguide.icu-project.org/icudata" rel=3D"n=
oreferrer" target=3D"_blank">http://userguide.icu-project.<wbr>org/icudata<=
/a><br>
<br>
So for big endian system, we can use the separated data file which<br>
re-generates by icupkg and set the correct ICU_DATA environment variable<br=
>
to make sure the library can load the data without problems.<br></blockquot=
e><div><br></div><div>Fails on various builds on the AB:</div><div><br>icup=
kg: unable to open input file &quot;TOPDIR/tmp/work/ppc7400-poky-linux/icu/=
60.1-r0/icu/source/data/in/icudt59l.dat&quot;=C2=A0<br></div><div><br></div=
><div><a href=3D"http://errors.yoctoproject.org/Errors/Latest/?filter=3D%20=
icu:%20do_install&amp;type=3Dfailure">http://errors.yoctoproject.org/Errors=
/Latest/?filter=3D%20icu:%20do_install&amp;type=3Dfailure</a><br></div><div=
><br></div><div>Ross</div></div></div></div>

--001a11377fbcc87a5a055f965c54--
