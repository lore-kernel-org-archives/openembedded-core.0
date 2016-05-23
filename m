Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B10F60761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:34:19 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n129so86244010wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4lENT/+lf+1zpymJsKMabsOL+S9L+dd4AcenJ72IdrY=;
	b=RGmmYUfncGoWtoTQAgoQ40b3reXRMFEtdIxjK+CS8YvvOIKuWCqAdliRCwK9/nvFu5
	boFyspczeei5UiNSTJSzA2reqqw2dAc/3Btz+xA1ds7TbgSGcQDMyXP+ko9h5o705V60
	VzsyXwRV2BC8YcZ9EPaslWg0yC1Nwsn1vEavxCkYQD9mGih3tbjJwCHFE7LM17fgF2FY
	qZNk3osxvWzq0nUFVaJq8KGiHQvYAsr/U0MLY0K/7iX6UaXf1IT6njCro1GFsFiONZaP
	E9cdZb6hB1F+2ti3Thyd8ycKKlkJ5LaNGRivOnvCCSCmdozFLtQd5U3YQ+s6SD4/mPIT
	nZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4lENT/+lf+1zpymJsKMabsOL+S9L+dd4AcenJ72IdrY=;
	b=U8OfBlFjFCaJO66Rj4xTNS9bwVNuP+PtEQXFt5YxZHqvJLQpHK2HAEA6XCntIWp8KC
	49Ih2gyLcmQunLImGLW0dzNofODIopz7Ie4Avnq3QCpfCAY5CiQn+w0II2EUJ45ZrKjo
	Ko6uBtKdjhAxPsIWYGh5I/3BwNsGmgCqjDhIHim4dnS6WItu2imBF+9LC9i94aF8/y5+
	Qt769dZnhO6wMaEzQDs3PHg5TjTxovFR6PFPWogGtSvxy7+EYHJG0Fi2TilExmKXm/he
	y3bFRJ41c2J8SOvv/RkRIfSTlLtx8ZaYuXgWyjlE868AZEjQnb+hmN/W8rb6mE3dJ/r6
	F4rA==
X-Gm-Message-State: AOPr4FUCaKMxvKm7vE9uj5jXnuzhLe4/rox5a8evYCVvoIqZLhWSrgT3zRKgLDkPsQEDsQ==
X-Received: by 10.28.5.78 with SMTP id 75mr18275345wmf.69.1464035659190;
	Mon, 23 May 2016 13:34:19 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	xz3sm37157136wjb.10.2016.05.23.13.34.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 13:34:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 13:34:08 -0700
Message-Id: <cover.1463769811.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Support template files for wic
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
X-List-Received-Date: Mon, 23 May 2016 20:34:20 -0000

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

It's been suggested that the name should better reflect how its contents are
used, i.e. .bbin or so. I've also considered including something like 'bbv' or
similar, to indicate its contents are that of a bitbake value. I think this
should be discussed.

I'd love to hear questions or comments on this. I think the value is clear,
and it's something we need to solve, but I'd like to hear if others agree or
disagree on that, and whether this implementation is appropriate.


The following changes since commit f6b0b260ce18a30d04edfb0afb7942b9f9a5480b:

  lib/oe/rootfs: Fix DEBUGFS generation, without openssl (2016-05-20 10:20:42 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core wks.in
  https://github.com/kergoth/openembedded-core/tree/wks.in

Christopher Larson (3):
  image.bbclass: append to prefuncs/postfuncs for do_image_*
  image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
  image_types.bbclass: support template .wks.in files for wic

 meta/classes/image.bbclass       |  4 ++--
 meta/classes/image_types.bbclass | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.8.0


