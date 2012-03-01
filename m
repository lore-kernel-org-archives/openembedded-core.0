Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S2wuP-0007NW-7D
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 04:42:25 +0100
Received: by obqv19 with SMTP id v19so224276obq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 19:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.193.73 as permitted sender) client-ip=10.182.193.73; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.193.73 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.193.73])
	by 10.182.193.73 with SMTP id hm9mr1290938obc.29.1330572835327
	(num_hops = 1); Wed, 29 Feb 2012 19:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8rNqrL6VB71kLChZPoxsIoVF3yqFf3nnDc5eDMe2jX8=;
	b=beY9DIGwN9iNPjwNU/AO4Jb75M0GKeeOBr9vEO+WMYzbylhdWegUJn8POrdG7H6qm6
	yl386httNitPVXObdTgeCG9lw7UtC3nGVoT2gEk3VX3xYTHxowj3Gx7w4pCUdGXbv/L2
	6rBYZCQ8F75WhocLNsHenZI/aDxhT0eeqGIF8=
MIME-Version: 1.0
Received: by 10.182.193.73 with SMTP id hm9mr1112572obc.29.1330572835280; Wed,
	29 Feb 2012 19:33:55 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Wed, 29 Feb 2012 19:33:55 -0800 (PST)
In-Reply-To: <CAMKF1spZxmWem68=G3COfc1ukBwbtemMPRrpznTEjrK5=DvU+g@mail.gmail.com>
References: <CAGDS+nk7a=X-zrjsv9RtuH-YzSLX=gAsqbtpVkF+tQ=saJQP1w@mail.gmail.com>
	<CAMKF1spZxmWem68=G3COfc1ukBwbtemMPRrpznTEjrK5=DvU+g@mail.gmail.com>
Date: Wed, 29 Feb 2012 19:33:55 -0800
Message-ID: <CAGDS+nnxh6u6EXhzzr+X8giuwm8mC8Nbo6wqcA6Afpj1_MOybg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: wpa-supplicant strangeness after pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 03:42:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 29, 2012 at 3:56 PM, Khem Raj <raj.khem@gmail.com> wrote:

> and this is yet another case where basichash exposes an underlying problem
>
> see the sed command in below snippet
>
> install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
> ${D}/${sysconfdir}/dbus-1/system.d
> install -d ${D}/${datadir}/dbus-1/system-services
> sed -i -e s:${base_sbindir}:${sbindir}:g ${S}/dbus/*.service
> install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
>
> that command can only be run correctly once unless you delete ${S}
> since its sedding something in ${S}
> and we know base_sbindir (/sbin) and sbindir(/usr/sbin) are close
> enough expressionwise

Makes perfect sense.  But quite scary -- makes me wonder how many more
things like this are lurking as yet undetected!  This caused an
obvious problem right at boot time so it was easy to detect.

>> I'm beginning to suspect I ought to just do a clean build after every
>> pull in order to remain productive!
>
> That will hide these kind of issues you bring forward :)

You are right of course.  Sadly I only get to bill for getting client
work done, not for debugging the build system :-(

So my motivation is typically to just get things working again
quickly, rather than to dig in and find the root cause.  Need to find
a happy balance.  Lately I've been spending the time to document the
issue on the list, but if a clean rebuild fixes things I just forge on
with client work.

Steve


