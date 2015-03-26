Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 122D26013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 11:56:22 +0000 (UTC)
Received: by iedm5 with SMTP id m5so44224190ied.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=JcgjPUIVO8LA1V9Zh8/83Dzh0D7rW5ru5YbnUhAp9ow=;
	b=Yyjm+6gqMy99DR7Gj72xJMKyPBKbkEyV/cEys8Ow/Wq6U5O/DAhGovsHbeYFmYarWc
	//GmFnTeRbrG1zGT5RcvYMfujxFANd6d/OrdnbMZTLNEJlLKtljbdAQ2RFV8x/Yp58LS
	7O3GI8ourPu6abyfX7iMYl5/QOpwhDjrO1XrKW30Snh3WqBYvJ5MKUt1TEXbKcqy8uhx
	8bU8cYbwwbn+L2yTTkvFJI4aS+bMOnFdWV6ibGlpQP77NOiD57TucFrC2LH1+SylHTOk
	zUpo5EEXcldF0Fx/LH6a4ujJlAWxerlPem2E1hhqRW3b787j3KJyl8pyZNIQvNeeaaio
	9p0w==
MIME-Version: 1.0
X-Received: by 10.107.134.219 with SMTP id q88mr20053727ioi.27.1427370983777; 
	Thu, 26 Mar 2015 04:56:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Thu, 26 Mar 2015 04:56:23 -0700 (PDT)
In-Reply-To: <20150326082923.GA7370@ad.chargestorm.se>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<20150326082923.GA7370@ad.chargestorm.se>
Date: Thu, 26 Mar 2015 08:56:23 -0300
X-Google-Sender-Auth: 9sl2koSCha4qqyvXK77oEhEQWGo
Message-ID: <CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Thu, 26 Mar 2015 11:56:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 26, 2015 at 5:29 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Bruno Bottazzini <bruno.bottazzini@intel.com> [150325 22:50]:
>
>> if one wants to launch a simple deamon, most modules are not
>> required.
>> He will be able to save space and exclude unwanted packages
>> from the final image.
>
> I like this, though I've got a few questions that I just noticed.
>
>> -PACKAGECONFIG ??= "xz ldconfig \
>> +PACKAGECONFIG ??= " \
>> +                   gcrypt \
>> +                   kmod \
>> +                   ldconfig \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
>
> It might be worth noting that xz has gone from being explicitly enabled,
> to depend on a DISTRO_FEATURES.

Agreed and we shouldn't explode the number of possible dsitro
features. I'd also prefer if xz were kept enable by default so we
don't make a behavior change under the hood.

...
>>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
>> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
>
> Why do you remove networkd as a PACKAGECONFIG?

If there is a real reason for this, it must be recorded in commit log as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

