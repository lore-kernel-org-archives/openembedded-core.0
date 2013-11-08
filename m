Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89FCE6D6DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 11:10:41 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hv10so1301153vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 03:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SwIsSnLKc3ByzWDulV8p91JCLEHQYU68xthygHZ6JfY=;
	b=dykfje6UAme0txyP299RfL2pPrWYoWBje4XQBmjHz3PU0jQM1A97vs/geL8XdIIal5
	9MuH8WkNMS8xZJmWsVSP2yn4qATj5khqiinxbS4ufW4tuaimnRopyeSQ0E+aOEE76ufG
	3aGckXGSChmim9FkkC36DsMH9vvM9ct7Fs1xPXbUeU8eExUKReluEA9PBRsYcgx+cily
	UQwJ6S+ovzio/b0g2pW86C2gSdz0/On23HGh7gw8GzDvWu43cfpLvYR7hHzli6uOdCJT
	rJAIH/RNO66pROfIRWP1ahL89UoVBg8v+usjwGPxFNjAxLqKRRqO0jb30Aq4DzJ02S1X
	RHJQ==
X-Gm-Message-State: ALoCoQnzgp2lZjJZEvPa7NUMVbpgTgNZdSmi7NjPrPeNaHTfnH7jup4n4Sv8i9aKRV7vCvuVbhtl
X-Received: by 10.220.169.203 with SMTP id a11mr11650727vcz.26.1383909043043; 
	Fri, 08 Nov 2013 03:10:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 8 Nov 2013 03:10:22 -0800 (PST)
In-Reply-To: <1383182088-17411-1-git-send-email-rongqing.li@windriver.com>
References: <1383182088-17411-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Nov 2013 11:10:22 +0000
Message-ID: <CAJTo0LYDs_ebD2oWKxv3PHQ8aKGhZe8jKLFpShnV0sRf0FzihQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Fri, 08 Nov 2013 11:10:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 31 October 2013 01:14,  <rongqing.li@windriver.com> wrote:
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connman.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Connection service
> +After=syslog.target
> +Wants=connman-env.service
> +
> +[Service]
> +Type=dbus
> +BusName=net.connman
> +EnvironmentFile=-@LOCALSTATEDIR@/run/connmand.env
> +ExecStartPre=-@LIBDIR@/connman/wired-setup
> +ExecStart=@SBINDIR@/connmand -n $CONNMAND_OPTS
> +
> +[Install]
> +WantedBy=multi-user.target

I'm thinking it might be better in the long term to patch the service
file in case upstream makes important changes and we don't notice.

> +echo "CONNMAND_OPTS=$EXTRA_PARAM">/run/connmand.env

Let's not pollute /run too much, there's already a /run/connman on a
booted image.  Create that directory if it doesn't exist, and put the
env file in there.

Ross

