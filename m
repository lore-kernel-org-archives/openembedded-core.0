Return-Path: <harisokn@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 42B486B0CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 15:43:10 +0000 (UTC)
Received: by obdgf3 with SMTP id gf3so131246496obd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 07:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=tLmvGkClKLzzsN4jUiWbL2w0QBcXE7zeu86CEZvmyxA=;
	b=fkYMy7au9Dz5pJgeMQHAJJk2l2vys5ipsZfZ1qsBQug13Sa8iQDSTfHmlCsetTL3KN
	rjzh/qK4nqa8i5pdRFsg8sCWyTbRsgUYWptLpN95KhRYI4d0r2GbHUwtvljzz/XStTLn
	/xm7kYANL2ffD07khRN+70u8xAot3icjR69qO/hI7mcg10b48x6fTRQqMEY1MCTFvzcR
	K9rnFqRGtev2Osq80iXWfSqSMOjI8GYYmQONUrluzC2H71cBB1ulBaAX4bGoxoF7CZIg
	PIC1U4A8XWxYXS7KT0FdPGfgTTVEVuFFSfH9J9J/7cTpeN2n7zai2g74Q9P89i1fOClS
	qoDw==
X-Received: by 10.60.233.103 with SMTP id tv7mr46896457oec.69.1448898191330;
	Mon, 30 Nov 2015 07:43:11 -0800 (PST)
Received: from harisdt.amer.corp.natinst.com ([130.164.62.207])
	by smtp.googlemail.com with ESMTPSA id
	gv8sm21446480obb.20.2015.11.30.07.43.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 07:43:10 -0800 (PST)
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
References: <1446235976-7118-1-git-send-email-haris.okanovic@ni.com>
	<563BD196.2010005@collabora.co.uk>
From: Haris Okanovic <harisokn@gmail.com>
Message-ID: <565C6E8E.6040706@gmail.com>
Date: Mon, 30 Nov 2015 09:43:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <563BD196.2010005@collabora.co.uk>
Subject: Re: [Fido] [PATCH] openssh: Backport CVE-2015-5600 fix
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
X-List-Received-Date: Mon, 30 Nov 2015 15:43:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2015 04:00 PM, Joshua Lock wrote:
> Thanks, I've pushed this change to my joshuagl/fido-next branch of
> openembedded-core-contrib and am testing it now.

You can find instructions on testing the vulnerability at the following 
URL. I forgot to include it in the change description.

https://kingcope.wordpress.com/2015/07/16/openssh-keyboard-interactive-authentication-brute-force-vulnerability-maxauthtries-bypass/

> Regards,
>
> Joshua
>
> 1.
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next
>
>
>>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
>> Reviewed-by: Ken Sharp <ken.sharp@ni.com>
>> Natinst-ReviewBoard-ID: 115602
>> Natinst-CAR-ID: 541263
>>
>> ---
>>
>> This patch only applies to Fido and earlier releases. Bug is already
>> fixed in Jethro which builds OpenSSH 7.1.
>> ---
>>   .../openssh/openssh/CVE-2015-5600.patch            | 50
>> ++++++++++++++++++++++
>>   meta/recipes-connectivity/openssh/openssh_6.7p1.bb |  1 +
>>   2 files changed, 51 insertions(+)
>>   create mode 100644
>> meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
>>
>> diff --git
>> a/meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
>> b/meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
>> new file mode 100644
>> index 0000000..fa1c85e
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
>> @@ -0,0 +1,50 @@
>> +From b47bdee5621f95387c9ac5b999fd859ccb1213a9 Mon Sep 17 00:00:00 2001
>> +From: "djm@openbsd.org" <djm@openbsd.org>
>> +Date: Sat, 18 Jul 2015 07:57:14 +0000
>> +Subject: [PATCH] CVE-2015-5600
>> +
>> +only query each keyboard-interactive device once per
>> + authentication request regardless of how many times it is listed; ok
>> markus@
>> +
>> +Source:
>> +http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth2-chall.c?f=h#rev1.43
>>
>> +http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth2-chall.c.diff?r2=1.43&r1=1.42&f=u
>>
>> +
>> +Upstream-Status: Backport
>> +---
>> + auth2-chall.c | 9 +++++++--
>> + 1 file changed, 7 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/auth2-chall.c b/auth2-chall.c
>> +index
>> ea4eb6952f8c13928c3fc595007f2d844dde422f..065361d3ec22f4f131308d1b4497afada3c3cb78
>> 100644
>> +--- a/auth2-chall.c
>> ++++ b/auth2-chall.c
>> +@@ -83,6 +83,7 @@ struct KbdintAuthctxt
>> +     void *ctxt;
>> +     KbdintDevice *device;
>> +     u_int nreq;
>> ++    u_int devices_done;
>> + };
>> +
>> + #ifdef USE_PAM
>> +@@ -169,11 +170,15 @@ kbdint_next_device(Authctxt *authctxt,
>> KbdintAuthctxt *kbdintctxt)
>> +         if (len == 0)
>> +             break;
>> +         for (i = 0; devices[i]; i++) {
>> +-            if (!auth2_method_allowed(authctxt,
>> ++            if ((kbdintctxt->devices_done & (1 << i)) != 0 ||
>> ++                !auth2_method_allowed(authctxt,
>> +                 "keyboard-interactive", devices[i]->name))
>> +                 continue;
>> +-            if (strncmp(kbdintctxt->devices, devices[i]->name, len)
>> == 0)
>> ++            if (strncmp(kbdintctxt->devices, devices[i]->name,
>> ++                len) == 0) {
>> +                 kbdintctxt->device = devices[i];
>> ++                kbdintctxt->devices_done |= 1 << i;
>> ++            }
>> +         }
>> +         t = kbdintctxt->devices;
>> +         kbdintctxt->devices = t[len] ? xstrdup(t+len+1) : NULL;
>> +--
>> +2.6.2
>> +
>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
>> b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
>> index aa71cc1..9246284 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
>> @@ -25,6 +25,7 @@ SRC_URI =
>> "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>>              file://CVE-2015-6563.patch  \
>>              file://CVE-2015-6564.patch \
>>              file://CVE-2015-6565.patch \
>> +           file://CVE-2015-5600.patch \
>>              "
>>
>>   PAM_SRC_URI = "file://sshd"
>>
>

