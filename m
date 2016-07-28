Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id E44D260721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:43:00 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u186so163854154ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ojMl28pEgCcCgu7ii5ezjVng/sHuNU+1Dv3BkqrYfHk=;
	b=VzOypkMMKUxI7HBEi2ZahxqnuC/vFFT3MCIKcgOJ5SkPbB8mlVhlubcTCTIsUtK0EB
	7VVBKxUWEbdlBwOHERqLKITPI8SJLsRqCmyVCBQ6IzCwwMqtMVL9tnJXKr8DfkNoZCzQ
	zNvp8yehe0i3PR6X3e7F+qefreAsEnWPptQAUhEeFJP6vb3aDyYCfZ9d4iHu0LRqPPPk
	U6sVG3aCWLrIQ7GOsGkXYHL5Tdfj8CEqVQJKGzz6xqu/AfVNzjYVGe3XPmgVz70DnRyL
	hnEvk08NOrPZXUIb2LW4PFDD8M+vzXbwn2ExQlRSPHbZWhO2xk3wiNBtsrku+N84MU7J
	qo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ojMl28pEgCcCgu7ii5ezjVng/sHuNU+1Dv3BkqrYfHk=;
	b=fJSM4U1LSiZeNcF6X7MWRN3X2a4ljLUOtw5YwDMnjBbmMYwarz7gcqRAZHsdTQte3X
	FOJZ4gDrUgF7P+L06090ROrKiV/MQa5QBbTXFjdwByvI/AycMCBU7tWgYDvWCEvmExwB
	auI7Xyllv6KEATyJAH+ekFaCquxAZuxExCBYhEhwghMgv5IbR/FsgeLXw/tjUjLGkRjd
	DcME9YD/8OqPwwADSHl9AzEDi/Xn5gIFjcFja3KhMyPvublkbg7JCmMRchke4ZOUtAmr
	Ik7yzQuZK1ObUtRjCRU/RZVjhDsogtu+9EuQlPuIIpoNxv3VThhYR3iVRQCPiFYADo2p
	i4tA==
X-Gm-Message-State: ALyK8tKRZQiRGC32HZu7uHFogbOiADBJhmVjpQBDc6bYl3o0wf8TeqrjSekzVuGdbJcZxs2t
X-Received: by 10.36.26.194 with SMTP id 185mr110547854iti.28.1469698981644;
	Thu, 28 Jul 2016 02:43:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C97F.dip0.t-ipconnect.de.
	[93.232.201.127]) by smtp.gmail.com with ESMTPSA id
	a65sm4617642itd.18.2016.07.28.02.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jul 2016 02:43:00 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 11:42:51 +0200
Message-Id: <cover.1469697989.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
Subject: [PATCH 0/1] static IDs bugs and usability
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
X-List-Received-Date: Thu, 28 Jul 2016 09:43:02 -0000

In Ostro OS we just started to use useradd-staticids.bbclass. Dynamic
IDs are an error (USERADD_ERROR_DYNAMIC = "error") by default because
warnings probably wouldn't be noticed. I was a bit reluctant to make
this change because Ostro OS is supposed to be customizable, and that
becomes harder when developers also have to define IDs.

But we didn't have a choice because after updating to recent OE-core,
our dynamically assigned IDs started to change randomly between
builds, which (as we learned only because of that change) broke the
swupd update mechanism. Personally I suspect that Python3's
randomization feature is responsible for not getting deterministic
results anymore, but I haven't investigated further.

useradd-staticids.bbclass has a bug which impacts developers when they
edit the table files to fix a warning or error raised by the class:
the cached version of the affected recipe continues to be used and thus
editing the files has no effect. Patch fixing that follows.

There's also a caveat associated with how USERADD_ERROR_DYNAMIC = "error"
is implemented: it marks recipes as "skipped" with an error messages
from useradd-staticids.bbclass. This is not particularly developer-friendly.

For example, when the skipped recipe is deep down in the dependency
chain, then building will fail with rather difficult to understand
"nothing provides..." messages. It does mention eventually that a
recipe was skipped with the right error, so the information is at
least there.

However, it's also possible that a recipe exists in two versions, and
only the one normally picked as default gets skipped. In that case,
the remaining version will get build, i.e. useradd-staticids.bbclass
has the very undesirable effect of silently building something else
than expected instead of aborting the build because of the error.

I've not seen that in practice, though, so I don't know how big of a
problem it is.

The following changes since commit b32d430c3c7dccf3a8d06ab492d648893a05950f:

  dpkg: use snapshot.debian.org for SRC_URI (2016-07-26 08:56:08 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core static-ids
  https://github.com/pohly/openembedded-core/tree/static-ids

Patrick Ohly (1):
  useradd-staticids.bbclass: trigger reparsing when table files change

 meta/classes/useradd-staticids.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.1.4


