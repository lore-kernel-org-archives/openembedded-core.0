Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id A200A71C69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:29:26 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so123735493itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:organization:mime-version
	:content-transfer-encoding;
	bh=e4E2GD48iE1x22/DboUW/nABlxFyspPzkpizDz8kN5g=;
	b=TmjLzRvSjECdHrD+gbDGN7c8dzXcR81ckBSJTuhwEB0uTTuHjn9YHal6jPnDKwQ2V8
	m59TSjvZMe+0NdQnK2beUMAAXt60u8DSC2R0c/UrPQsIZyiKQGOLLT8IR6wZO+JVVJ9W
	koZUifRZcL3MS3qbgN+G7oclP1TbKsntJYT/DEAPKhqp1GlVDq78tkD/Kaka2oTogQJ8
	Liz/57sfTbvr+9fDTjWsD4I/LuDBfG/RGaPqzJXTkK3bNZx6i7KzUwbu293cAUU2FFHr
	XN++15UTataTHagjL4P0MlhvwfvIiLARAI58VyFWrGX3n6+77hX3LNPlDjR6PcdFp5/t
	7LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
	:mime-version:content-transfer-encoding;
	bh=e4E2GD48iE1x22/DboUW/nABlxFyspPzkpizDz8kN5g=;
	b=e2Emi6+9Cy/IuGFb33izrVambbByDsOLwsApc3bvtue4HS/h8nvKy1s362Q8k0YOTX
	6vBtFJaX0DLA5z/KfGxzcAamIETQAHzPhsK8RFSGpAo9mUqLjoiJKOeNGLEiQJPzQ6B0
	7II1/wXq9NIcW56QeoXImBgfmG70N26soB4eQrO670v7k05k1gzaBij26CZPj1FZIXN+
	cyNWjsFyYwv4qg5BMk9DNCr/VHffPIywHDb4ASyWwm5bFR7cSHKCkk42I1oxOSzIKCRJ
	eMRtuI4IsZcubNypgjv1Jg5eBKGJ481zhyAWcAQcrOX3iMTxn/4SoUi0ErnONv9s9VLw
	DhRg==
X-Gm-Message-State: AIkVDXLfpAKpGdPUJFOY5LWZGapX5eIzkTR1GGTR2FtYapSDhwYS6k2l94HPSnioCGxJUlWp
X-Received: by 10.36.116.7 with SMTP id o7mr224526itc.31.1485865766444;
	Tue, 31 Jan 2017 04:29:26 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DFEB.dip0.t-ipconnect.de. [93.232.223.235])
	by smtp.gmail.com with ESMTPSA id
	r85sm8178521itc.13.2017.01.31.04.29.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jan 2017 04:29:25 -0800 (PST)
Message-ID: <1485865762.20333.161.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jan 2017 13:29:22 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: potential bashism in guile_2.0.13.bb
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
X-List-Received-Date: Tue, 31 Jan 2017 12:29:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

verify-bashisms (after some fixing of the script) reports:

/work/iot-ref-kit/openembedded-core/meta/recipes-devtools/guile/guile_2.0.13.bb
 possible bashism in guile_cross_config line 94 ($'...' should be "$(printf '...')"):  
        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
			> ${B}/guile-config.cross


This is for:

guile_cross_config() {
	# this is only for target recipe
	if [ "${PN}" = "guile" ]
	then
	        # Create guile-config returning target values instead of native values
	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
			> ${B}/guile-config.cross

And the resulting guile-config.cross has (when /bin/sh -> /bin/dash):

#!/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/guile/2.0.13-r0/recipe-sysroot-native/usr/bin/x86_64-linux-guile$ \
--no-auto-compile -e main -s
!#
(define %guile-build-info '(
...

This looks rather strange to me and I've no idea how the Linux kernel
will interpret that first shebang line, which literally ends in
...guile$ \

Is the content as intended?

It builds, whatever that means.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




