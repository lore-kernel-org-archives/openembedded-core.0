Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B091977303
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 19:29:10 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 9so67901519iom.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 11:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=pVBQ9FjbGo3K5qniOpaMufBl0otNb1fFKKUBlm0dtsA=;
	b=m87pdzRsTRhKti+mAHrioWZZ94/5LV9zcCd+wj0mEqOzNU105cRTMCJjUfkRe7fRUc
	3Kw2/dxNDDm8Re4yAuJwbgRdN2f3ENirUOAbRXt07Al9mhORKJBzTcl101aNQpB30Vs4
	N8acc0qoBW1j4DUzwU9gKdRJaF2EXPxLTA61z+4C64kwVQYpC3HSAAkSQO7rL6mrgayW
	Z0Ki6QZiz5mP8nWuedz6U+EA5qew0PhTo5nD3QzhPUJrz+wxd9LlbObaRw30fks4wxj8
	2cGUlor7PaSzi5lGJZWPQKZfk0r7wgpQlp8hRj37RXKQ+kT5swEX+/tExg2G92PHbHgX
	byMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=pVBQ9FjbGo3K5qniOpaMufBl0otNb1fFKKUBlm0dtsA=;
	b=hF8ubB7kUoo0SM1Lf2Xx4U/SckqTvKJKrfcF4yGI+gbQImJfjKtVZDj6hk4Sabbx3Z
	YunOEVPAg7VGYgnlWajwqTG2y/jzx/rdml/0jpKvVcHJk2Jk5U/3g2iA00nfIV7KlIBI
	y+YFisuBf9zh97pXKvRoCh1m/YU72zPjVNcpw7lefMqeFjtvj8Wa6MdSu0gFI9dqwKFE
	bp2mx4wp2/GUA3rBt6J8VQuNhrlgZWChHuqBIpnov6HBMuGfyp6DA8nHcy0ZS0YZTFu8
	N6F2dpXsYNL5xL2zNR5Lfk/qo1cuAHKVauwyFDhxlSiZ8M0wSlrGmXaLFk5Hl1Dbe6RQ
	jKUg==
X-Gm-Message-State: AG10YOSbQXPjsuy7i0mywUSXACXZouQJXvT55cQUSNFndSSHnx7QqxZcro2HfgLV10hGWA==
X-Received: by 10.107.16.81 with SMTP id y78mr5324708ioi.13.1454527751055;
	Wed, 03 Feb 2016 11:29:11 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ee9sm3418647igb.7.2016.02.03.11.29.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 11:29:10 -0800 (PST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56B25500.7030402@gmail.com>
Date: Wed, 3 Feb 2016 14:29:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 19:29:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

My chromium build is now failing due to:

     commit 86ade2cc2553c942d9526c5323a11ae151653505
         binutils: Upgrade to 2.26

| FAILED: x86_64-oe-linux-gcc  -m64 -march=corei7 -mtune=corei7 
-mfpmath=sse -msse4.2 
--sysroot=/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64 
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro 
-Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC 
-B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin 
-Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections 
-o chrome_sandbox -Wl,--start-group 
obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o 
obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
| 
/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin/ld: 
error: 
/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../lib/crti.o: 
unsupported reloc 42 against global symbol __gmon_start__
| ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42

Any suggestions on how to approach this?

