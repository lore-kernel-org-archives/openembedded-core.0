Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f41.google.com (mail-bk0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id A3CBD6E831
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 16:18:31 +0000 (UTC)
Received: by mail-bk0-f41.google.com with SMTP id na10so2961171bkb.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 08:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:content-type:content-transfer-encoding;
	bh=qnBQFhnfH9GddFq6MFRa2XZW2u8H4Egy4iB/qmmnQ1k=;
	b=Q3V6yWaqidtdWrcNEnrx4lSbzmK9IokEQM0EUm+bJ6ALf6z3rYY9zKiFbL1YBKQC3C
	n5MO00hotth8XPIL58zizD0zznNymdQSMbq7AU7PmB+WSZQeuHwPBMu119uzIrl79+zp
	5oZMqFY+vhfErlYFCyOuAkH93k3Z/8zEmHWg2W98jH6/OuiOUrl5fgGtWmyFCProK9hy
	XV4AdlkVLcXNF8tQ8k3wD4QAfLk0uc7agn7MDNwBOqED3LQWRBdBOvEG+ILuPqhoD24k
	XluRwu3UlIb+ssNm/ZOmncjeru3CoBu+Ij9zVg+ctiO0ULyezS05uoAAqStDEbVk5Obp
	Uh9g==
X-Gm-Message-State: ALoCoQniRaCobWUMA/fFMBngJb3X8MBJ9yuXtaODGNxCWbt/59TbQKewKZf1wwCsi4J4zObu9/Iz
X-Received: by 10.204.126.74 with SMTP id b10mr187495bks.178.1390839511972;
	Mon, 27 Jan 2014 08:18:31 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	dg4sm13957840bkc.10.2014.01.27.08.18.30 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Jan 2014 08:18:31 -0800 (PST)
Message-ID: <52E686D4.4040906@dresearch-fe.de>
Date: Mon, 27 Jan 2014 17:18:28 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.6
Subject: opencv QA issue
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
X-List-Received-Date: Mon, 27 Jan 2014 16:18:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After the latest update of our build host (Fedora-18) the opencv build fails with an QA issue.

-------------> snip <-------------
ERROR: QA Issue: non debug package contains .debug directory: opencv-apps path /work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java246.so
WARNING: QA Issue: opencv-apps: found library in wrong location: /usr/share/OpenCV/java/libopencv_java246.so
opencv-apps: found library in wrong location: /usr/share/OpenCV/java/.debug/libopencv_java246.so
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /CACHE/jenkins-workspace/hipos-dfe-closed/build-closed/tmp-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/temp/log.do_package.15005
NOTE: recipe opencv-2.4.6+gitAUTOINC+c5afaa4e8d-r0: task do_package: Failed
ERROR: Task 502 (/CACHE/jenkins-workspace/hipos-dfe-closed/meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_package) failed with exit code '1'
-------------> snap <-------------

After some research we found that the libopencv_java246.so wasn't build before the mentioned build host update. I'm not a cmake guru, so i can't determine why it is build after this update.

But it seems to be clear that the path /usr/share/OpenCV/java/.debug/libopencv_java246.so is not covered by the package-split definition in meta-oe/recipes-support/opencv/opencv_2.4.bb:

-------------> snip <-------------
FILES_${PN} = ""
FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
FILES_${PN}-dbg += "${libdir}/.debug"
FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-------------> snap <-------------

Can someone of the maintainers please have a look at that!

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

