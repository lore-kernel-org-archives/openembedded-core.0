Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C2EB7731D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:23:08 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id c200so8272446wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 02:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=IqFUIDMqPbDX9gqUK0NexMLUaGlJKFD+2f9PdD/7paY=;
	b=TvhysGwVMZNm3Wlu6iDBB2PoRePDng8sh1foeEBkoMZIwVXYHep2o7e/U6q4S1jf5N
	I52ZwcRBzI2FPBQhN0ht2SYTmj0+89v6UbHJ9Vt8PtJcPwuMvsoIPG0GNP8m5+IqPbjM
	1UIvqGBzSLIwL4rKy3AhlaR+DQUNjjS26NrMQrunTHEv3qlN+VWzoVgFL3h1HYPC6A8f
	O6swmHNICg0jmx5/bHg3aZ8gBPosjCoagZ3BYAEVIcTpxG1z7Ek+0mfFTofV3RiYI+wo
	vYc/fMbbGH/2bFnBFdDoc6bVKkVS+d+MirgjM+sxTsieZSCUQcJdA2g5vwjvzgTy+t/H
	LdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=IqFUIDMqPbDX9gqUK0NexMLUaGlJKFD+2f9PdD/7paY=;
	b=V8M93lOb2QjLeslAHrWfJejpQtabg6ttbzK1FjnkI35oOjcLK4adXhRjFsS7d/J7OE
	yLnP87AaLHPz7etUtlS1uPN2gtQgC/PD8E7WMwGqM+LRZGPdqPyxLpQXgyQmHPAubdOi
	EcploUIpgOv5pvvTklNm8RRdSLb2Fe9n7p7hIz+u+FrZNw8ur5sqmto9+hx4Agv4X65l
	iKGrn3HaOhftPVtLWRhsR+OnKnByPk86nD6iVZXPqq7/nconFPlKqm2tR49H082kmBP9
	88DYnCCrkLJpKskBvtzYPmsOhOFMjubrGkadQ4PlsCEWDPCgXxXOFapdRkHbIEigdaDv
	Hb8g==
X-Gm-Message-State: AG10YOQcWoa5C94C9iwiqapVHv+yDsHH3c/4veGjujFNFJGAwRUxATiaeDKF2PYDUaz6Rw==
X-Received: by 10.28.86.10 with SMTP id k10mr10639659wmb.28.1454926988669;
	Mon, 08 Feb 2016 02:23:08 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	u191sm11935241wmd.4.2016.02.08.02.23.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 02:23:07 -0800 (PST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1210
Message-ID: <56B86C8A.9020304@dresearch-fe.de>
Date: Mon, 8 Feb 2016 11:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
Subject: kernel not booting if build with gcc-5.2.0
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
X-List-Received-Date: Mon, 08 Feb 2016 10:23:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

While switching from fido to jethro we hit the next problem. :(

For one of our machines (based on Marvell Kirkwood, very similar to OpenRD) the kernel build with the preferred gcc-5.2.0 does not boot. Immediately after the kernel is started from u-boot the system freezes. The last output on the console is "Starting kernel ...".

If we build with the also available gcc-4.9.3 the kernel boots fine.

The kernel version is the one siggested by jethro:

 SRC_URI = " git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine \
 ...
 LINUX_VERSION ?= "4.2"
 LINUX_VERSION_EXTENSION_append = "-hikirk"
 ...
 SRCREV_machine="64291f7db5bd8150a74ad2036f1037e6a0428df2"

Any suggestions?

Regards,
Steffen

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWuGyJAAoJEIz5slJ1krPh1pUP/RtqrOY8EIjpksnpOuF4hecR
fyigic5MN4D+/n4meRUOXYOGZHvBSWIQXLYvfooCTAMYaQS+J96B+2ZCVkv52AI6
NyGGdUJ065+yPt3obgOBP2/yJXsvJWPmlIa6SZDawwXnsr2hJZE2wrCpDWeVXvyy
LnhykrkCcblTvHH2nWkK+Tym1uOAfNrU8bqptm66jrSKg/9gysSicwamzyAeofrU
K+gizGKa4mj54QeINvGKwVWOzSWPNBuAszfnnDwcg9Cpc1GZpjc511oUBMO2xCqH
Sub8D0yBtGreokfYDl5FDlT+7n1qtpliZ7ZFZH0TZqWazA021u0nZ/UWHQe3UtOI
uaswhTdRQqL+okqKqrIAvcTuFcCZxBVd8orz7wEm/3huTAWIWQplyPWSOXjeK9es
MbkO/daNLsRzF/PJgX+zF5mk1F06o/zYwXRzWboNMPeir3ehet2N1CUKLJVbKMW3
cDvYXEtvYwXe8JtYPxQUN4ceruxqvrLVdZMhViIiVOXqGmRsXPsPKQIE9qXIa4gY
GTY/n7FSHThf1q3j3cTu+p2AWpGgYzaaZ/i4mFK72Sn0FHZZGPEtB6/QvvFEORLn
7Dfm3YThf4od6V1T1JVDQKwRIXeGjXRNb27bWyWIOhkLx+mfh3Y9HaCXfIeXsyk+
5AkiQRfKR/O29IePx0a0
=J9ka
-----END PGP SIGNATURE-----

