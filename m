Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id DF3156C482
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 09:10:50 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id b5so41900600iti.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 01:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5e3QIeRaejEOsqeXrNAI1r0G6lYoHwwTYpahYzl3AWo=;
	b=GmuxjhPGQkX+IjbdcFiRFWdSgmOHhw5Ygqy8i1KNGzNXNwbDpGypYCHn4nmZJfsebO
	P3FpLOwtrYNxbGRMuE+CvqCqLbsHl3fDIT2rzuCrsCdOogX+H1ajdxJIcDrHBMabaQcf
	wR9hD5kE6HXhYnH7MX9WGjJ0VZCQ6HdRGIiMjH619cKuazq+y5Vl3g0GRlgt5haylQMX
	GLbQHUb8cTQaznvIP+Wl3LfynwSsNxDlopwswnaGpmHYIR8ELld2jh04MUvW1ETQaa2+
	IMJuGc2CyG7llCeC4DoXGjnbYYFRGq2cG8XJ7aawr9HDEY9TyCy9lUWa/UTFEHEsEpgY
	PG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5e3QIeRaejEOsqeXrNAI1r0G6lYoHwwTYpahYzl3AWo=;
	b=Z7hRSstXZ5/r9vISRG9Ky2SJiz5n+3LucTGjWGjRRp0tTP0YiSAXEhM3iHMWsne3GO
	Rzzfxaj9KwL+CITuNiQE78cS9loNOcZyQrG30qT38kKz/Mv3bkFDCyW6ROBElLGhsv+b
	ToH0cPg6EUEta7cjCbqeRJBpvkHP3lzDAOjiRXeYCuF9PITnJtwMuLg4HwraDVMeoWF2
	FntRCfbj4pGBbipCEDfcNjVcV+LUsUDq+lGWWTi6We40xHPisf8wxkmtV3mMa1RhSnBz
	ulho+2ZKmdhcDFS4R0xLIAqNLAkee/GJoBJjy/i4kSQoLCSbDOkoRsKSfPgAUmbdvVVv
	Z9jA==
X-Gm-Message-State: AA+aEWZRjD3yVcqHZBBgYn+7sYrImJajN6K6rmyl5BJbX4DOBqbbxnp6
	l1g7Cl4pwnTYUuG7KiPr/mi0nIYviSuwzduEQFpMaQ==
X-Google-Smtp-Source: AFSGD/Wn5bv8yLFoBJWvuQOIOiaZHWKDTRfySqUamSxinfcHlqnS5LMJ0N3LtHbuwNVNzExexvLWyMfVTcdZzT9d1Q8=
X-Received: by 2002:a24:c601:: with SMTP id j1mr32740595itg.130.1546506651937; 
	Thu, 03 Jan 2019 01:10:51 -0800 (PST)
MIME-Version: 1.0
References: <8c406411-18c3-b5ea-7ff5-38a9e3a30e9e@windriver.com>
In-Reply-To: <8c406411-18c3-b5ea-7ff5-38a9e3a30e9e@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jan 2019 09:10:40 +0000
Message-ID: <CAJTo0LamH5StorHNoA8H5mYctC8Pi5GqAWoHAy6kS_PeRTJWOQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Efficient ways to delete a build directory
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
X-List-Received-Date: Thu, 03 Jan 2019 09:10:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jan 2019 at 02:39, Robert Yang <liezhi.yang@windriver.com> wrote:
> We can see that find -delete is the fastest way, rsync is the slowest one,
> and rm is close to find. Maybe it is because find and rsync are improved in
> nowadays, so they are faster than rsync.

That's good to know.  There were some improvements to the syscalls
recently that was meant to improve this sort of thing, so it appears
to be working.

Ross

