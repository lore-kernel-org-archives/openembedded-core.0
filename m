Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 188E87723C
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:39:22 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id v186so147522132lfa.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 07:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=e7ko9ordL3/pZy98I1WLmb7tbp20Y8gUd8b53UgKQq0=;
	b=10bVxgWqsL3eQlj0mkoOPVRLp/8aZW8Pk5g0KK9vzAgtM+QXnIA8Pqnam52vu45mdP
	brWX1L/EQUY57AaZCOYOSjKgqPPU2SvkLq+LleP0yvvceb3DO4GeU9om7vVzaXJ78yKx
	c6blWVsD4uZ5H+I4gSAdOdJAngMpGNqkeA8bMhqmwMs20XnV8VhG7IflayVao2QhOZq4
	re/GjA0CLJckEIySjibNdqw9O768o+ZiwtH+0/XR3seCn9y4tyaTwrh9vQQ/qYv8DH1b
	UgZTySS0zAelbyhN/6WtDoUfaAxM512y+QGxkbOb0rEGafj6lKJ02g6v3cEKW7XB6Kbp
	ywEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=e7ko9ordL3/pZy98I1WLmb7tbp20Y8gUd8b53UgKQq0=;
	b=ou8LggUofQtfd0tEMY8i/F9ES5w3c1LEbb4aNRIIYqkc3ygHRm2+EYTu0vJ1dIPl7k
	hcXzPxtuOtojgspLuBLBvNQnZOYq6N6Y6QuaownyxGN0uO9FN7Gkk8K974le2eXmzSVd
	VgBU+YSgaGJcu+rvp9gm5cjOsRE/SsYPELg3aocbJgUe7XFtIXz999osLzO8GoqnUsRg
	zOjYye8U3mW9k+TTpmRRwmST1y9udEvCjIer3JJIL346/w8oqMgQzrAvgZEo38/S2L0d
	DdVwCKcl36YWAfWF5HmYO8th5SFZQhgvY98vtCCT4e0tXe8UZ4pFWJo6GCmyCgbRa1fv
	+4tg==
X-Gm-Message-State: AIkVDXIQLDf1oGiKycj9BqItP0vzozMWeJ1Hy+YqTrwbyKbHoA1mlSFWFO7vuUauYyl7Hg==
X-Received: by 10.25.213.78 with SMTP id m75mr1167070lfg.36.1485445161951;
	Thu, 26 Jan 2017 07:39:21 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	d16sm581938lfj.28.2017.01.26.07.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 07:39:20 -0800 (PST)
To: OE-core <Openembedded-core@lists.openembedded.org>,
	Ed Bartosh <ed.bartosh@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <4f3ba191-aa55-8cb6-6d4c-fbfd0c451ecf@mender.io>
Date: Thu, 26 Jan 2017 16:39:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: sysroots, wic-tools and rm_work
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
X-List-Received-Date: Thu, 26 Jan 2017 15:39:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

It seems like wic doesn't work together with rm_work, because of its
dependency on wic-tools. The reason is that building wic-tools will
result in rm_work removing the very sysroot that wic needs.

It's easy to fix locally by adding

  RM_WORK_EXCLUDE = "wic-tools"

however, I think this deserves a more permanent fix, and I'm not sure
which approach is best. We could assign directly to that variable, but I
would assume that anyone that uses it will assign directly to it, and
breaking wic all over a again. Or perhaps we could add an exception
directly to rm_work.bbclass? What's best practice in a case like this?

-- 
Kristian

