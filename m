Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E51F786B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 20:18:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r68so17800347wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6fUzzAe8vAHtJYZiH7Y5e3+Op1Z+y6hgM3JaWczB4rE=;
	b=mWPMO1+Pymx3ex+W7ZsA20IqdsvZPFgatRDireGUq5KTX8WOTFKUrKEV1Dkmz15Ewa
	741O1zK/Ek6OrgDI+pBv40/G0ORUSlq3EO4S3OmOrHyFN7AYjdncwMn0ivQuYGxdeZLb
	E3/lNuuSxhwfcOUXc0jCDUzMMjuTVuJL7zrkcXdq5hqDIcN68yRn8f48X9mk1/Aj9VO5
	/QMO8HxPdKSX2ze0GVowzk47rrcl3wkwB2ZKPsg1NQua0ZoTPHZ2Ftn96yzFC+BONsmL
	/3Lm5rRoTaovyG+mNdix7DYQXkrPCxlmlRna01ccUco/4gqYjC6A9jHLNhj9/kifJ1km
	3yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6fUzzAe8vAHtJYZiH7Y5e3+Op1Z+y6hgM3JaWczB4rE=;
	b=ZlYNSsc+2N/RtKCreJ/le1eLdpGR7A7gWCTU6B5SC3gWXWCS4axnS4CcT0mLnYU/jN
	+lh6Bvv47TyqgqBcejZwjqF9fpj4zw7ZbzplJ/Vl7LwFjn3oFQ6t0OxdElq8i81uLhFM
	WBgjq9eaf+cKaGmYV7ND/fc2fD9+/eqk2SNkDPRgKtVwAJSRPY4p/oihPr2d+uh8OAGD
	JaFK8aNjO18FC/uWMbfhIIPbPenZca6HecWjeV0P8tQSROjynIHcSppsennmjarWMiOu
	8KP9/X1BTRcg9zuqp2te+/QTFL6/Ys6rLO9APfffdDxWE3Coed8FtVX+SVh1+ChsE1rC
	sKXA==
X-Gm-Message-State: AJaThX71qREbwZNCWIWKIIbFwRK2cYqCQIoy1Am+7Cgh8F4adCvgf1GM
	YXDU3X8qzfi2vi16wn2gpyIm3yN75Tc2pS2J0sE=
X-Google-Smtp-Source: AGs4zMawuXkivlKtM7Q8+knqYBw9O9MKbMesntvJy10aj8ALk/SAo0rt12e4+SXeAEmq+dQ86yDXhrqETMBGYupQ4/Y=
X-Received: by 10.28.156.67 with SMTP id f64mr6858223wme.42.1510604281922;
	Mon, 13 Nov 2017 12:18:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.99 with HTTP; Mon, 13 Nov 2017 12:18:01 -0800 (PST)
In-Reply-To: <1510584490.22094.65.camel@intel.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<1510584490.22094.65.camel@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 13 Nov 2017 12:18:01 -0800
Message-ID: <CAJ86T=UQ_b0RLUTCTGPONvkxXCO_s3Hvim0Zh4_MpcBBPoDpeA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Mon, 13 Nov 2017 20:18:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 6:48 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Thu, 2017-11-09 at 21:54 -0800, Andre McCurdy wrote:
>> The default systemd-tmpfiles config file expects to be able to create
>> files etc belonging to the wheel system group. Currently the wheel
>> group is created at run time by systemd-sysusers, but that doesn't
>> happen if systemd-sysusers is disabled (as it currently is by default
>> when building with musl libc).
>
> Isn't this something that the systemd_create_users rootfs postprocess
> command in rootfs-postcommands.bbclass already takes care of?

systemd_create_users() does a build time pass over the
systemd-sysusers config files, but those files are not installed if
systemd is configured without sysusers support.

> I know that it is has issues (https://bugzilla.yoctoproject.org/show_bu
> g.cgi?id=9789), but it should at least create the wheel group.
>
> --
> Best Regards, Patrick Ohly

