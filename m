Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8017671CA2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:38:03 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so38055685itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:organization:mime-version
	:content-transfer-encoding;
	bh=kLxah2wxWHOwSfvfQT+ql9cfsw9XlsCbJyIxmnwqNy8=;
	b=VmwBMXkT9VS5AgteDtYFMifqQD1nJQ3Y0hnqc6E3MpMT9L1GY8wI6ntnB+z7sYaAOp
	K6ThgYaHSGqUFpVqTGfCmv4IP6PVHzwsbZju6u3IFVf9IdkVSOtCEVWVHJahBVkX2xkc
	7ISOwUqYk66ijYEuatveaOa5tHj5V5dTadieq/LPeP34jgzMV0hFaa/Gz5VJbiEe4llo
	BTp4N4h58SVAlY6A9EvQJ/Q8RO3gsbMwR2qqviVZq/o4iVWkE8wWnNfisAzwgFp/7eMT
	VR9ReKk6wXU7a1Cb538V4IpRkVvdihMmR372HShRJwfpHG7rGpmGa8laTEHN09u1arWh
	p7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
	:mime-version:content-transfer-encoding;
	bh=kLxah2wxWHOwSfvfQT+ql9cfsw9XlsCbJyIxmnwqNy8=;
	b=s6yzQPWahPzqMp2gDYLUK1KD69pS76JWuz3sy5lR0XlHs1K+N4cG5Rv6fHipxkaBNt
	mJwoIhTd4irxmRZ3JHJ33IYEm6kKm2U4b49qvpjokdr2mFFH4qceNtJXMThgPPitfHsr
	C9xMNTVwVt+x54CZBJ2eCg9KbeTPyRwV1zZBX1f9b0g7Y4A/B+6CM40EoeLmcwoQ3D6w
	S1yVOc8SIq5iq7mmDafwZVl3yA/ySMfzYOaIxOkOoksPDkr41pwKVzery3yy58LJNIDG
	cpK6qGzM0horrDpxJLrfRAPKqDnYRa4xWv8FN49leE/WIx+FSA7F6A5y3xtLEQ32rpLI
	d73Q==
X-Gm-Message-State: AIkVDXJO+2gb/k/wPsbfG4YCiqurL07vWtNZzTzU/0CuAFagra4OjDWCAhCMLhSFyUVLZIpW
X-Received: by 10.36.104.15 with SMTP id v15mr26726166itb.104.1486031884082;
	Thu, 02 Feb 2017 02:38:04 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id z42sm694333ita.6.2017.02.02.02.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 02:38:02 -0800 (PST)
Message-ID: <1486031880.14889.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2017 11:38:00 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 10:38:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

Recently the host-user-contaminated QA check triggered for the trousers
recipe in meta-security:

WARNING: trousers-0.3.14+gitAUTOINC+4b9a70d578-r0 do_package_qa: QA
Issue: trousers: /trousers/etc/tcsd.conf is owned by uid 1000, which is
the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]

However, that's a false positive in this case. UID 1000 got assigned to
the "tss" user in the target sysroot during the build, and tcsd.conf is
correctly and intentionally owned by that user because tcsd checks
ownership and refuses to start when owned by someone else (including
root). It just happened that the UID was the same.

This is likely to affect all recipes with files owned by dynamically
created users, in particular when the host system assigns UIDs from the
same range as the target system (quick poll: who else has 1000 as his
UID on his main Linux box? ;-)

The current solution is to suppress the QA check for affected recipes.
But I wonder whether we can do better.

Why do we make the real user ID on the build system visible at all when
running under pseudo? The uid and user name have no meaning there, as
the user won't exist on the target system. Instead we could map the
owner of all files to root:root by default, i.e. in those cases where no
other ownership is recorded in the pseudo database.

The usual reason for host-user-contaminated is when do_install does a
"cp -a". When mapping the real owner to root, that command will end up
doing the right thing: create a file owned by root on the target.

Because the host user cannot leak into the target anymore, the entire QA
check can be disabled.

The only downsides of this approach that I can think of is that it hides
such sloppy use of "cp" where "install" would be better, and it might be
slightly confusing at first when working under devshell.

Any thoughts?

Seebs, I suppose this wouldn't be hard to implement in pseudo, would it?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




