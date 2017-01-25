Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 184FF71984
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 10:43:15 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id v186so126438736lfa.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 02:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=oRAsOnOD6rk3PSZXU5oHu6O/t8fLEPSvYK3pNu1tvtY=;
	b=DFz7eXfvSj2xkn6+Z7skKgBwuPI5qCwT4lOhyQnW75j/wPFZcVJFWIMMn153XZaICK
	dbUDTA8FUdM/23mYFWrWjuMI2PbyKcuXXjvzfazxKycVuPM+oE/EQv2ydiqoz5Dm8hj4
	oC8x0Rp24MQMqr+c4a+INavoqjUfUoaRaTZ5la0frBy8zk4crPuLbbAJKtQUcw9rjYxW
	kbCo+jlZJXeu1gRnRtUekLe/InfZAzpEs/nyJPCGtSi2ttoJSr6+i7ld59fUKpQ1wGxI
	IyBUt70C5pLaJ22meR/Ri/qIAgair5raW/Y4xTW5j6roPzCJIj/3FgSwRFlQ+FvdGD31
	NK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=oRAsOnOD6rk3PSZXU5oHu6O/t8fLEPSvYK3pNu1tvtY=;
	b=pSduE6kTHIXfSeLKhgibYrvKycTBOnFrAGh09BLObCdES82yQAI9dscYa3Ldc0fcnr
	2gcouMZLRaSC54DeUP5uQQ85FaeM4in+YljZ06gqQCfOkaU3eT8fqySRLCNPeiHlRzlk
	FHzPeaOogrDJCxL3NG+78YK5jakUf5goN2/Ka0GD8cnwsiSlRf5A96At7BOyhp/aKNyc
	SGsEzShgmGcXTRLQ+I1Y4y0t/Gi7PnrHKT1Eo5ysVWR2XAFNsjQ2acCHe/SUpnvciQXo
	L5vqTTLc6DwH0Xoqc3Pn9x9inNYDu68N14qeifNQPg2xwGdnR06V8e3PO0bXbdEsrBub
	r+tQ==
X-Gm-Message-State: AIkVDXJfeN3aRmHj+UXoay7i+qHpaPYwm2TTCUxAXPB80Xz0gs+k2pYYF+rln4C1H/YjDQ==
X-Received: by 10.25.134.195 with SMTP id i186mr12616779lfd.79.1485340995246; 
	Wed, 25 Jan 2017 02:43:15 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	x3sm8166381lfa.7.2017.01.25.02.43.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 02:43:14 -0800 (PST)
To: OE-core <Openembedded-core@lists.openembedded.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <18981a79-4241-83a1-a1a8-3eddf941c346@mender.io>
Date: Wed, 25 Jan 2017 11:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: Overriding fixmepath
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
X-List-Received-Date: Wed, 25 Jan 2017 10:43:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

After the new recipe sysroots were introduced we've been having trouble
compiling Go. I've narrowed it down to the path replacement mechanism
that goes on using fixmepath.

For example, this does not work:

  bitbake -c cleansstate go-cross
  bitbake go-cross

But this does:

  bitbake -c cleansstate go-cross
  bitbake -c prepare_recipe_sysroot go-cross
  rm -rf
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-cross/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3
  cp -r
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/sysroots-components/x86_64/go-bootstrap-native/usr/lib/go-bootstrap-native-1.4.3
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-cross/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3
  bitbake go-cross

IOW, if I replace the recipe sysroot with the originals, it works, but
if I keep the modified files put there by the prepare_recipe_sysroot
task, it doesn't.

And this is where I admittedly get a bit lost: I haven't fully
understood how the fixmepath mechanism operates, but from what I can
tell, this path replacement is not appropriate for Go. It doesn't care
where it's installed, and always operates relative to the GOROOT
environment variable, which is set by all Go recipes.

Why the path replacement triggers an error I cannot say, but I suspect
it has to do with the fact that Go object files are a bit special
compared to C object files, and this operation in fact corrupts them.
More mysterious still is why this happens only on some build machines,
and not others, but once triggered it appears to be consistently triggered.

Any advice for what to do next? I could try to skip the fixmepath
operation completely, but I'm not sure how, and it feels a bit like
using a sledgehammer where I should be using a scalpel.

Any help appreciated!

-- 
Kristian

