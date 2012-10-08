Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TL6LE-0000u2-8K
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 07:57:24 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so3963262vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2012 22:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=tf5CF185RqqZtDlLmhl6uSOPzl5VTR8lQpvAtrwAxd0=;
	b=Zl6GLB2d3AHq9jdmivxvwPiStlKrqQmsdexq4d87AKbKk6OIK20ToLENcNx7tKzo6Q
	iiTNtNTU0WDbAsJ9MbjiYtpVH4VFBbKR4iwSVaDmeAHWc3U5kw2iGnx3/AQnyyBQYIF7
	ioe2vn49GPdO4PdHHkicZg40mmRcMuahvYIREMEO4fXSPc+9qcdqK8kkm+tggRcTNRLL
	Nm16jva5k16r/WSlLTsE+XXUQDHpBl3fIg786GqwjLXp6lrFvgqDI/eNXTOLYoTxHivN
	k3yCKVEBZugcPaq3xRXcZ70JKR5+b6GlUJrCxhBlrsHeHfYjGTt13EiuR6u8c0IdFskB
	vMCg==
MIME-Version: 1.0
Received: by 10.58.209.73 with SMTP id mk9mr9590057vec.25.1349675058021; Sun,
	07 Oct 2012 22:44:18 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Sun, 7 Oct 2012 22:44:17 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <CAPj87rO=rnyWBjnoMnx=2QCZ3BoMqfiq1w+Vf8qZAmMLyJg-sg@mail.gmail.com>
References: <1349437649.15658.20.camel@ted>
	<CAPj87rO=rnyWBjnoMnx=2QCZ3BoMqfiq1w+Vf8qZAmMLyJg-sg@mail.gmail.com>
Date: Mon, 8 Oct 2012 16:44:17 +1100
Message-ID: <CAPj87rM0BH_eU+6j66Gq7+mrPs2JbrwDZdu58gqwJ_34vNeKmg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQl7QlRv2YEJs6BCjVUrqSynqDbCOZanEspycZdJ/xNdW1d9OYJ+Gs7Lcml6TY18KymIouu3
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 05:57:24 -0000
Content-Type: text/plain; charset=UTF-8

On 7 October 2012 12:10, Daniel Stone <daniel@fooishbar.org> wrote:
> On 5 October 2012 21:47, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> We don't want the cairo dependency. Unfortunately simply checking whether its present
>> isn't good enough. If its not in DEPENDS, it can disappear half way through building.
>> We therefore need to explicitly disable it.
>
> I've done roughly the same thing in this commit:
> http://cgit.collabora.com/git/user/daniels/poky.git/commit/?id=96a6e8e9eb7c086be3fcbde6a38ac3b699fca008
>
> which has already been submitted upstream:
> http://lists.freedesktop.org/archives/dri-devel/2012-October/028514.html

My patch also has the advantage of not trying to link against Cairo if
it's present but disabled.  Without this, if you build libdrm, build
Cairo, clean libdrm and attempt to rebuild it again, the rebuild will
fail, because the test still attempts to link with -lcairo, which
fails as Cairo's .la file references libdrm.

Cheers,
Daniel


