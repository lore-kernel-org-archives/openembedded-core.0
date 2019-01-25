Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 805887C38B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 19:59:47 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id g85so12326381ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=gnTfq8haU/CAdpwRK6pgW9kJvfCDohTCEdDYyGKEkzY=;
	b=Y6A37WEGOp/cIGRDf/6mfw/6S138duvjpFlVKRkE3kUwABeIPAJnMzYeBXCJyFooIz
	Pcefsu+vhRbbR3f5WdZzG0n0A1zLZ+Ye+BGxaBMc1iOBlDS2YFh+ZPD7CXRjNr9bxnCZ
	N7Nesw7fWG2vhNjJAemFK7pR285j/ahuIECcvrTwt70Ublifx/dJUrrdZbtcZHcqkaBU
	NwU9dekoFmc0XpS4Gw0oMv42vmYYF31at1JfuyKHNtmGwC7WIgwGhpXa466Op8KxZQv+
	yIowDWh8Ybo5MHy+Xl2EuDzHk3+JTbULm/5FaX3VF/5cQM8IQZYqwqMUK+Cc4WWylhC2
	wBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gnTfq8haU/CAdpwRK6pgW9kJvfCDohTCEdDYyGKEkzY=;
	b=SAdqRQkbJC0stjwU+AvkmTtdktumnOEtyGJn9+Itw7D/rED66I43jEaknJyc5s3m0j
	/CkLHtBoThfwS05p7X3LC3JQVVrlLLuLW2w9+0/8xNXsEJnGmyr5Lg1bgv5czpYLiPxm
	YTdtCeQvnnrSbd4odjmpU3xs/oWU7i8C0dae8LpKFTQV6rojUsDbwtsmjlBoGYAMJQNu
	FFRZ8B6nH7oAN1H3pUa24Mfh1qqiqKQ19kHoAD7zgmB1Rqv88gZisp0JE3xOOl+ddWCJ
	Wx02DujEoTNQfslopEzrNL2Ai4D4t14MGXBmCCQWGqIxhi+7laF/jO7vYKtuEK8/fUxx
	gQXg==
X-Gm-Message-State: AJcUukeq6ZiLqRwOksLELmh0bJ+LF43mHhJHi3AQYzj52Qe2z+/eWUUR
	E32LmXInW0ROepQYvsTSj++Qnow84vAjDuBHcHfIU5YEOH4=
X-Google-Smtp-Source: ALg8bN4mXD0iddOxJaLZoNGgulv5/lKDYRjXaPboRXOMe9mPkfaVyZu5DtCUUzxw5LSAom5pz5iTfpljFxTIK9Jr11o=
X-Received: by 2002:a24:b610:: with SMTP id g16mr3352289itf.3.1548446387863;
	Fri, 25 Jan 2019 11:59:47 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Fri, 25 Jan 2019 20:55:31 +0100
Message-ID: <CAJkqNs1w3KaKsEGYEj_tVvfUTM37H3KMMRhQYr-AGcFFNOKNMQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] lib/oe/patch.py: Fix applying a directory as a patch
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
X-List-Received-Date: Fri, 25 Jan 2019 19:59:47 -0000
Content-Type: text/plain; charset="UTF-8"

If we add patch git repository to SRC_URI (e.g.
https://github.com/mirror/patch (without the .git suffix) or a local
repository /tmp/patch) the bare clone will go to
downloads/git2/github.com.patch or downloads/git2/tmp.patch and
because the directory ends with '.patch' the do_patch task will assume
it's a patch file, try to patch it, end with 'patch: **** read error:
Is a directory' error and break the build.
To avoid this behaviour I added a conditional to check if the path is
a directory.

The following changes since commit 1979d9162a335b7d4718a6697ca57bfa16237f0e:

  bitbake: gitsmy.py: Fix unpack of submodules of submodules
(2019-01-24 17:45:49 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib dziendzi/patch

Tomasz Dziendzielski (1):
  lib/oe/patch.py: Fix applying a directory as a patch

 meta/lib/oe/patch.py | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.19.1

