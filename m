Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id EAE2265D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:12:21 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id ex7so753516wid.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=c1pdgvdmpahqc2nmCB8jPfnt9h7e/aSLCPS0XbukXcY=;
	b=Jj6SB+Jc84iw2ll7k06UEM8Om4x31OuGwPwFaov+ueabb0OgCcitxEJiKz+FD1GTW3
	NKJqoDp1RQp+6gJfNDvM92OvqaiVvBkYBjNVbpg250ZbmGsEXXFEhWbtTb/U4tfCIBLY
	LCzRsf8W6QcVkIchlZH/zR4O2aOpvMMEx2+aBOiI0u2wg9Lgm3NfZ7owcLBQ2R47DYLC
	jeHfOEBiB04QgHDmasoe+sikh358hD3LLxQwSIx8GCSTNUdi/SPHnN6dEcuJqnT+PqSG
	t6Wl7yCBGRACid8GOiC7s3nhv1ZGHX/p/+6wEld8y0nk7ntLDoEw6UsM9ivJvFw66Zz2
	ESUQ==
X-Received: by 10.194.82.106 with SMTP id h10mr4662267wjy.37.1409227942450;
	Thu, 28 Aug 2014 05:12:22 -0700 (PDT)
Received: from 176066136000.atmpu0053.highway.a1.net
	(176066136000.atmpu0053.highway.a1.net. [176.66.136.0])
	by mx.google.com with ESMTPSA id z5sm14134137wib.20.2014.08.28.05.12.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 05:12:21 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <53FEF856.4060402@windriver.com>
References: <1396941362-27622-1-git-send-email-wenlin.kang@windriver.com>
	<53FEF856.4060402@windriver.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 28 Aug 2014 14:12:11 +0200
To: Wenlin Kang <wenlin.kang@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <94952656-b59e-446c-9753-7edf834f4dc4@email.android.com>
Subject: Re: [PATCH] busybox: fix a sh link wrong
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
X-List-Received-Date: Thu, 28 Aug 2014 12:12:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On 28 August 2014 11:37:26 CEST, Wenlin Kang <wenlin.kang@windriver.com> wrote:
>On 2014年04月08日 15:16, Wenlin Kang wrote:
>> When both bash and busybox be installed, without ash support
>> in busybox,if bash is installed before busybox in the final stage,
>> even if ALTERNATIVE_PRIORITY of bash > ALTERNATIVE_PRIORITY of
>busybox,
>> the symlink from /bin/sh to bash can be yet overwritten by busybox.
>>
>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> ---
>>   meta/recipes-core/busybox/busybox.inc |    8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/busybox/busybox.inc
>b/meta/recipes-core/busybox/busybox.inc
>> index 69b9b0c..bf2ddc1 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -188,7 +188,9 @@ do_install () {
>>   			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
>>   			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
>>   			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
>> -			ln -sf busybox.nosuid ${D}${base_bindir}/sh
>> +			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then

Better
egrep -q "^CONFIG_FEATURE_SH_IS_[^=]*=y"

Thanks,


