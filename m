Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21D236DCA7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:39:06 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so15592576wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 16:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cVEV36BG7BokFyoZdaue5eA4J5vTFhR1XkwIM72VKN8=;
	b=EWABzWDyg9lPV907gflys13ABdEWP29vfyoK8IlMJ0udvUEta/F8mIQlCzV+iThx59
	5/XlQ5uAhCoZBLDdrHaf4PJs1xXxF0EX/5PldqncGSTq7IbKWeH+3uG+N46CGeF8kdUF
	rueJUJZTZbp7YHmiUblRMErXEbhdZvSe3P/W/iFWecCM88rrHwCUUUI06KjH9F0wxuZc
	2ASpEWoZoqKVapigURfvd8TavvgiEutUPkyoF+6fBGxTh2N4xBUSZmDCpMUSoHIopiWF
	dmwjE4IRyGDmhWQ86r75bkniJhnsz5Y0fRule82tn/zjhnljPcmQLFCitgxi4K9nScuc
	Awsg==
X-Gm-Message-State: ALoCoQnchlsYainbKVUC2GgxKDl5GEEpyPQa3YQjAOVQnkqG3V4S+TliEJOomyefcKb3AZuln+ZF
X-Received: by 10.180.219.33 with SMTP id pl1mr9561500wic.49.1386203945927;
	Wed, 04 Dec 2013 16:39:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id qc10sm1032500wic.9.2013.12.04.16.39.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 16:39:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 00:38:57 +0000
Message-Id: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC][PATCH] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Thu, 05 Dec 2013 00:39:08 -0000

Hi,

This is a Request For Comments because it changes behaviour of the cmake class
and I'm not entirely knowledgeable in cmake.

For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead has it's
own variables OECMAKE_SOURCEPATH ("." by default) and OECMAKE_BUILDPATH ("" by
default).  Those defaults meant that the build happened in the source directory,
which conveniently was ${S}.  Unless ${B} was also set, in which case it all
broke.

I don't see a good reason for cmake.bbclass having it's own special versions of
${S} and ${B}, so this patch drops them and replicates some of the logic in
autotools.bbclass: specifically the part where if ${S} and ${B} are different,
delete ${B} before building.  This ensures that switching machine doesn't re-use
the same build directory, which was the cause of me going back to look at this
(libproxy trying to use the nuc sysroot when I'm building for qemux86-64).

Some open questions:

1) As I understand it cmake has more reliable support for out-of-tree builds
than autotools.  If this is the case should cmake.bbclass set B ?=
"${WORKDIR}/build", or leave setting of B to separatebuilddir.inc?  Are there
known recipes using cmake that fail with out-of-tree builds?

2) Is dropping OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH acceptable?  Nothing in
oe-core uses them and there's three (IIRC) recipes in meta-oe that use them.
Assuming the answer to (1) is "separatebuilddir.inc" then the only fallout
should be these recipes using in-tree builds until OECMAKE_BUILDPATH is replaced
with B.

Feedback and testing from people who actively use cmake very welcome.

Cheers,
Ross

