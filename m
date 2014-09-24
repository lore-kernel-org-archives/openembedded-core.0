Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5F51371555
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 19:43:57 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id c9so4045060qcz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 12:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2jczNGXXehUz4hAyigFN2S0tGH1/409j6Qa7/DZLRks=;
	b=G/GedOOBfpq9vw1SSmAv8Hv3STsTqVU35dqyL863mY+OWM6rt9d5wpUvviSvmGZeJl
	RtpTIzTSTkFZoi6UwqrbCoPrU9YFft++L9CbNHIL5BxVcKxrduELqiYKU5/WwlidvcC3
	TAlcHXqPYD1KZNym0B7uVgrMOqtkQG3/+pkCvgeyN0YPhFY6DLr2Zt7QZ9t9JerZuoxQ
	/doxfHXHr8yy7PpT4LCeQVtSRCJgf2Ydy9l0obAW0GZUEt7ikfTYQvhl8G1bmrcvjyW6
	Z9rHa+5K9FlQHoMZYp/HP3nLGkL+ZiMepup/TM/xxERjEcfpodi3hIBk0ooKbm42zVaF
	5H4A==
X-Gm-Message-State: ALoCoQm05/HiDpC8z4frNvw0p4qjBVrwWs0jkAiV0ZDaExsHPh9P2F8hw2qBDWAwRJZhdl5J1+sY
X-Received: by 10.140.97.247 with SMTP id m110mr1074636qge.80.1411587838855;
	Wed, 24 Sep 2014 12:43:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 12:43:38 -0700 (PDT)
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B732581ED4@pgsmsx105.gar.corp.intel.com>
References: <AF233D1473C1364ABD51D28909A1B1B732581ED4@pgsmsx105.gar.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 20:43:38 +0100
Message-ID: <CAJTo0LYFYFqY8kp1GtTAHvQaW0A7PYZy+zfM9HKqWmYHGzK9xg@mail.gmail.com>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Python Large File System Support
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
X-List-Received-Date: Wed, 24 Sep 2014 19:44:04 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 02:27, Ong, Boon Leong <boon.leong.ong@intel.com> wrote:
> I did a search around meta/recipes-devtool/python found many recipes files.
> So, I am reaching out to expert in this forum to guide on which is the right file
> to be touched to enabled LFS?

The important one is python_2.7.3.bb.  There's a "largefile"
DISTRO_FEATURE that is sorely under-used and should control whether
the arguments are added.

Tempted to say there should be a largefile.bbclass that you can
control whether it adds to CFLAGS or passes --enable-largefile (as
used by autoconf's AC_SYS_LARGEFILE).  The catch is that you can't
pass the defines globally in every recipe as they change the size of
types, so ABI changes.

Ross

