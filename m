Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id EDB0C78212
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 09:35:38 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id r186so487375pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=qdtuSTBAo5HawrOQUkIB13im3K3+K3fkiTer5xzTGZg=;
	b=ml3FiEhbLHX4MoMCBfAU5eZ6Zvrn64cXUgfyBNy7CDyKtDOZBpxR5dtWEhVm+3585b
	ry8lWggtUC7SmotXeAOEhiTcENImGOFeslD9rGAR0vfJJGHWnS42LTqPCd48E6M5cI1B
	baut2YpX4Q+3jysMZmjEGBX3b/9wF98g3zMYUUcQ3sJscdkP8dluKeed1TIYvCEzQA9h
	PeEfjcm666h6w5a/pVMD1Kp3pBBb1tlnO+9CKPsEedsgXvLiYxZHl7s8Ea2DloI3WvM+
	c9yyOAaskCwhCShxQMt37PE6FmoIrFSfOU06XraCLRAYlboOtLHJ8jnsiFV52OvmsL/n
	fMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=qdtuSTBAo5HawrOQUkIB13im3K3+K3fkiTer5xzTGZg=;
	b=tsQjJB0G5sXx77wRs6JiwXKcdIUy9wFDHfZQnSieolI965g900va9QtZMbKMS7icZm
	E/jjkMbVJPbTHm+4oQAgkUICK4dI65ACsWcJ20cSUo8dHMfG99/NW0litksMzwcIZkOD
	5IMNuyv67vK9XiM4LGPjfr0ywJgWwCXdH1O2jrSAUEYyOXdAl8kND2B2G3isFG/Oz+SB
	7uZAsjviqsYUNaQPzTk6NdsEiZiQjjdM+QvIi+xDRxiPJq/J7msd5Tdy1IqCQKO7GbhH
	KvaOA3Mc5HCCGRemId4i7S4eCMOlIhBtlLCA+HRVWAituFk3oF4SSN+KlKgrz/UDUhlf
	aAmA==
X-Gm-Message-State: AHYfb5jga+TJ4rckPiTpgEkfFM1ux18ZjrPR0HJRNaTjC3vJ9WE0qXS1
	B3E0YwcE8q5SKu6F
X-Received: by 10.84.164.225 with SMTP id l30mr6109022plg.317.1503567340038;
	Thu, 24 Aug 2017 02:35:40 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F93A.dip0.t-ipconnect.de. [93.232.249.58])
	by smtp.gmail.com with ESMTPSA id
	q124sm5604547pga.8.2017.08.24.02.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Aug 2017 02:35:38 -0700 (PDT)
Message-ID: <1503567333.3674.8.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 11:35:33 +0200
In-Reply-To: <1487758902-11574-1-git-send-email-armccurdy@gmail.com>
References: <1487758902-11574-1-git-send-email-armccurdy@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: fix ineffective include conf/target/${TARGET_SYS}.conf
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
X-List-Received-Date: Thu, 24 Aug 2017 09:35:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-22 at 02:21 -0800, Andre McCurdy wrote:
> TARGET_SYS is defined in terms of TARGET_ARCH, so it's not valid
> until after TUNE_ARCH has been set by the machine config. The
> original order of includes resulted in an attempt to include
> non-existent files such as:
> 
>   conf/target/INVALID-oe-linux.conf
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e421650..18d1cfb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -705,9 +705,9 @@ include conf/auto.conf
>  include conf/local.conf
>  require conf/multiconfig/${BB_CURRENT_MC}.conf
>  include conf/build/${BUILD_SYS}.conf
> -include conf/target/${TARGET_SYS}.conf
>  include conf/machine/${MACHINE}.conf
>  include conf/machine-sdk/${SDKMACHINE}.conf
> +include conf/target/${TARGET_SYS}.conf
>  include conf/distro/${DISTRO}.conf

I think conf/target/${TARGET_SYS}.conf must be included after
${DISTRO}.conf, because TARGET_SYS contains
${TARGET_ARCH}${TARGET_VENDOR} and TARGET_VENDOR gets changed by a
${DISTRO}.conf like poky.conf.

I also found this issue when writing an automated test that detects
when include file names change while parsing, and I agree that it
should be either fixed or removed.

See the "Yocto Compatible 2.0 support code" mail thread for details. At
that time I had missed that there was already a pending patch for it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



