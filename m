Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 172DB60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:27:05 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r68so23520647qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=43QoC6WkQKHOHT9ztyMPkACkqMaw+HPq+aaTHpyR3L0=;
	b=z0NdY9Xcz5w7KecIiKp8nc0uRuvndJ6ojD1K25D8RXNTk113aaBjSLfSVQhZg9q13T
	hnS65h5nEKK8ouI6dzjPP/h4sDrnPaRy1pdG3cqNsUBbqjYv+so0jOEA3wRNGDetHDYf
	As3FKeS9q7rhzV53th9TwFERxrJMKEoYBNP00hGesEthw8mvptd7DM2FvmSf/qEIRizK
	Z58oZAJV2bVUflHfX8AgUYs+1a4NrOQPiw1uVZYjTHMvEvXymaE7jm89P8q5jCzS71Cd
	MYIX/UKCBoW0hvzzQNm1DhfVR1roII6vr0szqCKuta5BIyqXIzQlVL6o0yKgaCWsQI74
	qQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=43QoC6WkQKHOHT9ztyMPkACkqMaw+HPq+aaTHpyR3L0=;
	b=H7GLXIFDmlrCp6CODe+rhpUPbPOAxzuwybCvmCLSeE4gqewOsBsMk9hgGqo3u+1gTj
	7Dfi2yEiQUYtbfVPkw4hzpyNAjS+8tWPrbbz0hpzdHs8mr/EQXIkX2XJpgJ+CUATvd+B
	EmvZcRgDxtAwAcot8v6XrAqojtsI3oCF+jQEIgUY+aW3V8oWXVuiNqffEu2ozOWSghYO
	/2HibzPxCecgSo8U/NNKT1EVUXGjUUkrd/DBWLWystVQ99kdTuNy+3j0LFcskg+Oj/ZD
	06iKKkygyyH20XWWjB6uTyuZyDY9IjrHMRz80grx0sdLwOGL/jFhGMHO9GoRjoSB89VS
	k9tg==
X-Gm-Message-State: ALyK8tKEDu9o8k1is9AulmQnuE4dEqdHLVj8xStfdG0OlEQupEkugFxl0MeBhY5MuA9v7A==
X-Received: by 10.55.17.88 with SMTP id b85mr563027qkh.104.1467408426391;
	Fri, 01 Jul 2016 14:27:06 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 29sm2652727qtz.19.2016.07.01.14.27.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 14:27:04 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:27:00 -0700
Message-Id: <cover.1467408317.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/2] Support template files for wic
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
X-List-Received-Date: Fri, 01 Jul 2016 21:27:06 -0000

From: Christopher Larson <chris_larson@mentor.com>

This adds support for .wks.in files as WKS_FILE.

This is a re-send of the RFC PATCH series as a regular PATCH series, to
attempt to get the feature merged. There's a clear value-add, there were no
major objections to the RFC series, and further improvements can be added on
from here.

These files are treated as the contents of a bitbake variable, so usual
bitbake variable references are supported. I considered using another
templating mechanism, for example the one used by yocto-layer, but then we'd
end up largely mapping metadata variables to template fields anyway, which is
a pointless indirection. Let bitbake expand the variables directly instead.

This feature lets us, for example, reference ${APPEND} in --append, and avoid
hardcoding the serial console tty in the wks file, and let the user's changes
to APPEND affect wic the way they do the other image construction mechanisms.

The template is read in and set in a variable at parse time, so changes to the
variables referenced by the template will result in rebuilding the image.


The following changes since commit 646c366c2566bd8dd6f73681cea9f5b021589a56:

  gst-player: upgrade to latest HEAD (2016-06-27 14:08:37 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core wks.in2
  https://github.com/kergoth/openembedded-core/tree/wks.in2

Christopher Larson (2):
  image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
  image_types.bbclass: support template .wks.in files for wic

 meta/classes/image_types.bbclass | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

-- 
2.8.0


