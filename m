Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4525D71A6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 10:21:11 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id b35so442844713uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 02:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MSMSscBxD7oZPZ+OkrZmgE4YhOBd0OmbvGpTh6Azl0Y=;
	b=Htmbmlao69XmsgIvJCW13j40qaOMWlNdS1EWt5ZTPHGnLhiCT+5ikm3y0DCsEKjFC7
	bciKAC6GcHOvsZGCV33SDTlGoeDzOfr8jaFEuHvmjzDsjSuId0MlgVcMdjFmXMwEz6lX
	+iY253jMPbmM0YyN48jFkfbGcYNFi5pKk1M0jxxoRHmtld7BNCHv1j4QzrSlngfLGX7y
	ACBVq7KlMGYuWHerdGXL5irYj8tTr9r0U0koRhHWVAUy17xEqiChLGGf8EHgOTH812Pv
	c1vJ/01j8dqZaMSM1dxdW0p1q/IUzu40ibsoGGG/HmNhZLWui5kZUdgGrbaBTaPdMExJ
	BWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MSMSscBxD7oZPZ+OkrZmgE4YhOBd0OmbvGpTh6Azl0Y=;
	b=A+k5stF45aPWMMCDHNRieLFxzYNlcdtUEHpjPKnwApzruZGc35gPv7oXz+tYgNTBGH
	6VXYx3kUL8wXL471uuHtTzGBinxgidrytwZuBmqOS0NRMKKn/XMWb3PN1VUO9SnXqctx
	wWHno/h29e1H9TnFkmMA2FB+jqij1Wknb/SD4dyWAIjkJvdSbTVzPqik9bLSgQUraHd7
	fWg9EB22S+1VNMLTnPVIAp0RlRhiyvRPecWZ+BdJLh7mK6ZUsJ9kuu/QO7T2fOY88X1T
	mCa9BmLrA5mocdU7MDKT2GmubG9nmaeVWmfYXIeBAsW/zph9z5pDmVzP3OsAxLQyyLe2
	8Dlw==
X-Gm-Message-State: AKaTC03k4TnNyiEC+DP4Hf9vJgsM1V0ADGcE5AK+WX/enrJzQPNplPQLWptVHvrA6cp8WK16r2CSM75ugL/wPA==
X-Received: by 10.176.68.68 with SMTP id m62mr47095511uam.65.1481192473119;
	Thu, 08 Dec 2016 02:21:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Thu, 8 Dec 2016 02:21:12 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612080508460.13529@ca624034.mitel.com>
References: <alpine.LFD.2.20.1612080508460.13529@ca624034.mitel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 8 Dec 2016 11:21:12 +0100
Message-ID: <CALbNGRTyW4UAamkmVYgJo2R=THjifJjttGv6bK_1EhXe1AxriA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what exactly does the "meta-systemd" layer do?
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
X-List-Received-Date: Thu, 08 Dec 2016 10:21:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 8, 2016 at 11:11 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   almost certainly a dumb question, but what is the purpose of the
> meta-openembedded/meta-systemd layer? i can see that the general
> structure of that layer is a pile of bbappend files of the form:
>
>   RPROVIDES_${PN} += "${PN}-systemd"
>   RREPLACES_${PN} += "${PN}-systemd"
>   RCONFLICTS_${PN} += "${PN}-systemd"
>
> so, in the case of, say, dropbear (which, from oe-core, is already a
> systemd-controlled activity), i see a simple renaming of the package
> produced. so instead of "dropbear", i'll get "dropbear-systemd".
>
>   what am i missing? what is the purpose of that layer?
>
> rday
>
The initial systemd support was implemented in meta-systemd and later
moved to oe-core. In the first implementation service files were
packed in extra packages named ${PN}-systemd. This was undone when
moving to oe-core. I think today meta-systemd is only there to keep
package feeds happy.

Andreas

