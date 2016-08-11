Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C21F177081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 17:11:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7BHBoYS001296
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Aug 2016 10:11:50 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 11 Aug 2016 10:11:49 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Chen Qi <Qi.Chen@windriver.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
Date: Thu, 11 Aug 2016 12:11:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Thu, 11 Aug 2016 17:11:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/11/16 11:26 AM, Burton, Ross wrote:
> 
> On 8 August 2016 at 07:04, Chen Qi <Qi.Chen@windriver.com
> <mailto:Qi.Chen@windriver.com>> wrote:
> 
>     Previously, localedir is set to "${libdir}/locale". This would result
>     in locale database installed in '/usr/lib64/locale' in some multilib case.
>     For example, if we build out a multilib x86-64 self-hosted image and we try
>     to build projects on this host, things broke and the following error appears.
> 
>       Please use a locale setting which supports utf-8.
>       Python can't change the filesystem locale after loading so we need a utf-8
>     when python starts or things won't work.
> 
>     This is because '/usr/lib/locale' is the default one. And actually the
>     nativesdk-glibc is now set to use '/usr/lib/locale'.
> 
> 
> This is irrelevant as nativesdk-glibc is configured to read the *hosts* locale
> directory.
>  
> 
>     Thus, we change the setting of 'localedir' to '${nonarch_libdir}/locale' to
>     fix the above problem.
> 
> 
> I see two issues here:
> 1) should binary locales be considered shared in multilib environments? (libdir
> vs nonarch_libdir)
> 2) what packages are not respecting this variable and hard-coding /usr/lib/locale?
> 
> I'm guessing WR think yes to (1), and is the glibc patch you also sent the
> fundamental fix to (2)?

Binary locales have an endian and alignment setting to them.  If a platform
supports both big and little endian, this common locale would not work.  (That
is extremely rare....)  Also if a platform supports different alignments in
different libraries that could cause an impact as well.  (This is also extremely
unlikely.)

The not-binary locales have no such issues BTW.

--Mark

> Ross
> 
> 


