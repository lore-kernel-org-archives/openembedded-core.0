Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkfGX-0004Su-CO
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 18:13:41 +0100
Received: by qabj40 with SMTP id j40so214725qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=eVAA8dpNW6BpOIS7+6hnOo5yz9/WV1FUsyOCtO+t8ik=;
	b=T394dnO2wV+t4GfoUs2oz9kz0Yj9IAzaQoftv9wvAGvrHCOPoz3F7J+LZ47UqN4Gjy
	wvEwMbm3l3lBQ0Tr97Ouc2vcC1eLAzxkZpWQsVsddEI6W7dbv6KEn5azwr2/mZt/y5mB
	ZJ6J8rECH26GyodqAHv2KeA9HqeII2+O3aKxs=
Received: by 10.224.175.2 with SMTP id v2mr25849054qaz.69.1326215172264; Tue,
	10 Jan 2012 09:06:12 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Tue, 10 Jan 2012 09:05:51 -0800 (PST)
In-Reply-To: <CAPhnLPB=UDp7P=G+TO7i0KBYhyDoZUw1g4ZSto4fFCm3ExsXLw@mail.gmail.com>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
	<CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
	<4F0C637E.8050704@gherzan.ro>
	<CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
	<CAPhnLPB=UDp7P=G+TO7i0KBYhyDoZUw1g4ZSto4fFCm3ExsXLw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Jan 2012 10:05:51 -0700
X-Google-Sender-Auth: mbee_ibCa9cz6VQWgtBRNzpHRLE
Message-ID: <CABcZANmwANCzaYbWKg=YBTijdoPPUGthMv=4OZm-G46m57FiAQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 17:13:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 10, 2012 at 9:55 AM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> Agreed! One note about "+". There is still a discussion about "or
> greater" licensing within the SPDX community about how "or greater"
> should be dealt with.
>
> http://www.spdx.org/wiki/proposal-2010-11-16-1-or-later-version-licensing
> https://bugs.linuxfoundation.org/show_bug.cgi?id=591

Interesting.

> I'm partial to, as a stop gap, re-including L/GPL-x.0+ license files
> into common-licenses until they hash it out and treating "+" as just
> part of the license name. It's not a perfect solution but it should
> solve most "or greater" use cases.

I've been thinking about something like this.

LICENSE_EXPANSIONS += "GPL-2.0+:GPL-2.0,GPL-3.0"

Then process the license, turning GPL-2.0+ into an OR operation.
Replace with (GPL-2.0 | GPL-3.0).

Perhaps coupled with something like https://gist.github.com/1590028 to
express distributor preferences, we then get a sanitized, SDPX, flat
string with the licenses we're going to be using for this. Then we run
this against each binary package's LICENSE (if different than recipe)
and ensure our emitted binary packages match up with our license
choices.
-- 
Christopher Larson


