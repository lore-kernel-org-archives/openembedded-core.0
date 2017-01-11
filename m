Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id B5FC76AC3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 11:10:42 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c20so93837501itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 03:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=we+axMCUFfLRa1GbnpFYVoQMt+JYvIyIlOY7+92tC4A=;
	b=HAeK4y2y6/ZXrEoJbJZcJhOBS2UlMk4ZvSr69VKpPOutsnvzMXwKloyNHYuNn1WAXS
	nxPviKmT/C+i/yGEunq6LD4ZjP6tXAo1vZXDGtHWsp/0wH0m8G33K9MHYfhfq2ArHBNS
	f/MnhD0G0W2O/yQ+QFSYawWgWD9XEHfvWFFYMpOvDjbEfDtbOP61aGHompygwvA8X1a7
	mZxx0m4Yi1w3jVLHRo21xTN2dciwfLtkZDLIb5clX1gOLNuMeWmzqgXfhGPmTad7E5Lg
	cZ0OOM6XpFQCuP2ELPg9ieRk0INS7DbSa2FSPzZnXF8bkKoln1PyqZp6DEWgxuweNelg
	LUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=we+axMCUFfLRa1GbnpFYVoQMt+JYvIyIlOY7+92tC4A=;
	b=r9mvzHJtNaU/hGbmzAIKqIovQsVK2ESokrIbJsZKa6TSNVd1kH+7JOSAczE7eNdHFj
	ey+cAqcSswhd5Ds9PeOdfGr+zQe/ycTZaoSj1is1dvSBhM8Sd7tRr4BYHa69O4oXtLtZ
	ex0fpDHBt0oAjm9n2v5Z5/Al+JWefamPaHd0+5twoFTyS37V/P3dWG024AJrBm6w6bJX
	wEmECiwgiPrN3NWpSGi4t5vQ3PdnxPwaYm63ylNt0/EQif4jOf2d+5JVDjaYmLV4cm32
	M488T0ldjh2JVN+n6dWRFgiVL9SDOMwP486tEQw82GVyIj/q4O4gUmh0TScBBD5qvIBr
	GKag==
X-Gm-Message-State: AIkVDXLuPm4i+3olkByAKXsjXjcEzP69y7JZWZtv+K8jMy21CIirZeSK5i8XznyQSEtz5d7x
X-Received: by 10.36.193.135 with SMTP id e129mr4528327itg.69.1484133042827;
	Wed, 11 Jan 2017 03:10:42 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8EC30.dip0.t-ipconnect.de.
	[93.232.236.48]) by smtp.gmail.com with ESMTPSA id
	n134sm2881019itg.19.2017.01.11.03.10.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jan 2017 03:10:41 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 12:10:32 +0100
Message-Id: <cover.eecd085acd37cef2ce0793e6bb962bf87f107b05.1484132929.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] improve LIC_FILES_CHKSUM QA check
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
X-List-Received-Date: Wed, 11 Jan 2017 11:10:44 -0000

In YOCTO #10898 I pointed out that the documentation for
LIC_FILES_CHKSUM beginline and endline does not specify whether
the numbering starts at 0 or 1 (it's 1) and whether the endline
is inclusive or exclusive (it's inclusive), and I offered the bet
that developers happened to use values that are off by one.

I also showed how to extract the right lines from a file with
tail and head and calculate the md5sum. Paul argued that this
isn't necessary: one could just pick some lines, trigger the QA
error message, and then use the md5sum from that message.

But when doing that, developers will not notice when they pick
the wrong lines. Therefore I'd like to propose the following
patch which adds the selected license text directly to the error
message. That's also useful when the text changes, because then
developers have the change right in front of them, without having
to look it up in the file manually.

Just for the sake of closure (and so that I win my bet ;-), here's an
example which is probably an off-by-one error (there's no reason
to include the "#ifndef cmake_h"):

meta/recipes-devtools/cmake/cmake_3.7.1.bb:
LIC_FILES_CHKSUM = "file://Copyright.txt;md5=7a64bc564202bf7401d9a8ef33c9564d \
                    file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"

vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=1 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I also found examples where endline was used without beginline,
leading to snippets that included the copyright line and thus
leading to more churn when upstream developers bump the copyright
year without actually changing the license.

I'm not going to propose patches for those recipes: including the
copyright years can be fixed as part of the next update that
requires changing the checksum, and the off-by-one problems
probably aren't that relevant (although I can also imagine cases
where a one-line license comment was meant to be picked and was
missed entirely).

Patrick Ohly (1):
  insane.bbclass: print license text as part of QA message

 meta/classes/insane.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

base-commit: 425afe2484707640ac71194885fdb263e95e9950
-- 
git-series 0.9.1

