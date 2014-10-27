Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F979601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 01:47:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9R1l2sU005642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Oct 2014 18:47:03 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 26 Oct 2014 18:47:02 -0700
Message-ID: <544DA413.1000704@windriver.com>
Date: Mon, 27 Oct 2014 09:46:59 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1414142394.git.Chong.Lu@windriver.com>
	<764d0d5ee52d46b0b33d577675d8fecc3e99800f.1414142394.git.Chong.Lu@windriver.com>
	<CAJTo0LY-oHnKxUrtGUyhA=jPoK5Dcjs==7+YyVTV=6M5Jufesw@mail.gmail.com>
In-Reply-To: <CAJTo0LY-oHnKxUrtGUyhA=jPoK5Dcjs==7+YyVTV=6M5Jufesw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] curl: Security Advisory - curl - CVE-2014-3613
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
X-List-Received-Date: Mon, 27 Oct 2014 01:47:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/25/2014 06:16 AM, Burton, Ross wrote:
>
> On 24 October 2014 10:20, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>      meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269
>     +++++++++++++++++++++
>
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch CVE-2014-3613.patch
> patching file lib/cookie.c
> patching file tests/data/test1105
> patching file tests/data/test31
> Hunk #1 FAILED at 49.
> 1 out of 2 hunks FAILED -- rejects in file tests/data/test31
> patching file tests/data/test8
> Patch CVE-2014-3613.patch does not apply (enforce with -f)
>
> Please verify that your patch applies to current git master.
>
> Ross

Hi Ross,

This patch includes windows characters.

+diff --git a/tests/data/test31 b/tests/data/test31
+index 38af83b..dfcac04 100644
+--- a/tests/data/test31
++++ b/tests/data/test31
+@@ -49,11 +49,12 @@ Set-Cookie: nodomainnovalue
+ Set-Cookie:   nodomain=value; expires=Fri Feb 2 11:56:27 GMT 2035^M
+ Set-Cookie: novalue; domain=reallysilly^M
+ Set-Cookie: test=yes; domain=foo.com; expires=Sat Feb 2 11:56:27 GMT 
2030^M
+ Set-Cookie: test2=yes; domain=se; expires=Sat Feb 2 11:56:27 GMT 2030^M
+ Set-Cookie: magic=yessir; path=/silly/; HttpOnly^M
+-Set-Cookie: blexp=yesyes; domain=.0.0.1; domain=.0.0.1; expiry=totally 
bad;^M
++Set-Cookie: blexp=yesyes; domain=127.0.0.1; domain=127.0.0.1; 
expiry=totally bad;^M
++Set-Cookie: partialip=nono; domain=.0.0.1;^M
+ ^M

You can apply this patch as following steps:
$ git fetch git://git.pokylinux.org/poky-contrib chonglu/curl
$ git cherry-pick FETCH_HEAD

Best Regards
Chong

