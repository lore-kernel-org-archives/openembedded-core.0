Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDA86AC28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 20:40:01 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id nt9so4755005obb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 12:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0T5pjVkAeFlsGq4k6WLlHSysfwN8kkONZRd4lkv9Z4g=;
	b=OlISZnhZD1nz//5BIZS4wGvupLiLgUK0uC6DfksSQ9No5M+v2O6SaIF4IXfqbuF6j5
	B6tNkhsFEIFc2orJhbS8hgC/5p9lrOS5/vpcWlKjkQspuqUTOj01KQ9OiCe9H9jBuE6H
	qsFMWW92lqsacy3buya4VwtMvF+wyTPTTPMJKSMu6bzc+xnY4lXuhDbPIXPeZzcWiwiX
	N13suqCh3A/KSJ4Ol9KCUJg+MEKdxp/g0TKPh1vL0rKIYWRlc/Coo0q7PGQLquayXFnO
	yFbyVofDzu1QQgJ/FZbxFGdw7SUoq+XAmpNyi/cp+HpYQKHraKLhtMo7QSAOBaDUWzDO
	yTlQ==
MIME-Version: 1.0
X-Received: by 10.202.102.21 with SMTP id a21mr4656613oic.118.1422650403147;
	Fri, 30 Jan 2015 12:40:03 -0800 (PST)
Received: by 10.202.217.69 with HTTP; Fri, 30 Jan 2015 12:40:03 -0800 (PST)
In-Reply-To: <20150130122421.272fee84@Fedora>
References: <CAJ86T=VV+SOyH-WW65Nb2cigL+kr+ne33RDStpOUxKZ_kiVSvA@mail.gmail.com>
	<20150130122421.272fee84@Fedora>
Date: Fri, 30 Jan 2015 12:40:03 -0800
Message-ID: <CAJ86T=Uw4dOLRxKn3K7u06Pv8=Ve2Q8tV_Vm1tCTU1TWjE67pg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Nondeterministic acl support in coreutils 6.9
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
X-List-Received-Date: Fri, 30 Jan 2015 20:40:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 29, 2015 at 8:24 PM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> On Mon, 12 Jan 2015 11:25:19 -0800
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> The GPLv2 coreutils recipe has PACKAGECONFIG support for acl, however
>> the coreutils 6.9 configure script doesn't seem to support
>> --disable-acl.
>
> I have the same problem. There's no QA waring aflter droping the PACKAGECONFIG.

I think the QA warning will only be seen if acl PACKAGECONFIG is
disabled but coreutils builds with acl support enabled (because it's
configure script finds acl headers in sysroot).

Steps to reproduce the issue are something like:

 - Blacklist GPLv3 packages (ie force coreutils 6.9 to be used)
 - Remove acl from DISTRO_FEATURES
 - Build acl (or build some other recipe which depends on acl)
 - Build coreutils

I think the fix is going to require patching coreutils so that it
respects --disable-acl, but I'm not sure how best to do that.

> I saw the commit message(8030fdc198c1037ae458899eebd14a4fae04c49a) and don'k
> know what the  "CQID: 430353" means. Is this a number of bugzilla?

CQID is a reference to Wind River's bug tracking system. Not publicly
accessible, AFAIK.

>> Build Configuration:
>> BB_VERSION        = "1.24.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-14.04"
>> TARGET_SYS        = "i586-rdk-linux"
>> MACHINE           = "vbox32"
>> DISTRO            = "rdk"
>> DISTRO_VERSION    = "2.0"
>> TUNE_FEATURES     = "m32 core2"
>> TARGET_FPU        = ""
>> meta-bsp-vbox     = "(nobranch):0bf672f55d7566541846f32878d87d232ce9e501"
>> meta-rdk          =
>> "(detachedfrom74057dd):74057dd18efb19601fdad551b5dc716a1c75bf43"
>> meta-metrological = "(nobranch):abbd111fee3ae1ade2fc2997ccda0eb9782da761"
>> meta-multimedia
>> meta-oe
>> meta-python
>> meta-networking
>> meta-ruby         = "(nobranch):200f6cafc878d4c26871fc56d21ecc8eaa9aa61b"
>> meta-qt5          =
>> "(detachedfrom41c5daa):41c5daa84af4466bfc9aa61f6f772c68470a628b"
>> meta              =
>> "(detachedfrom93d79fc):93d79fc162bd49387958e9e4d898dc4ba50d20b0"
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> WARNING: QA Issue: coreutils rdepends on libacl, but it isn't a build
>> dependency? [build-deps]
>
>
>
> --
> Qian Lei

