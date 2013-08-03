Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 929426041E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 18:37:59 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so3545369oah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=gi+GQDhJXIZ7wlB9mic4hx7n7/B/YWt4+Rwr/CMTSn4=;
	b=cgwcFRvfvCfn2hH1A1OXTE8exvL5Xk3jOWPiGtn4Ba1hK7diDxfkywYtqh6TJJeWR2
	9EAYOqpqlOkhZsvpXuxkeWix86wQ/wdJlqpt1Hhi0OZ5oem3dUthJSbv6SiGyeILxAiM
	nV0zFfe9AIonNwSCki4gUsQ4gejUAwnrZKh8UYrXqYwtdgWNfSaUVrZ9FWcGdx6em2Zd
	Ci+9ReFMsIxs/mY9H1RBbyeoknfbZOIqNtXnsS/6TwaGH0B/EuL9LMnbok8jQ9KvY3KN
	CQfEfDwD2NFp+Y4BKAPONH2ZNVlLyat2zy4FDfOGlNbS6zMnF9oftoYQeaqouAl6T81H
	qQ9g==
MIME-Version: 1.0
X-Received: by 10.182.118.129 with SMTP id km1mr9625781obb.15.1375555079731;
	Sat, 03 Aug 2013 11:37:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 3 Aug 2013 11:37:59 -0700 (PDT)
In-Reply-To: <CABcZANmU0=Pz7HzaifB1GOJuA2GC4ZQnEyiGy60=Veas9T3-RA@mail.gmail.com>
References: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
	<CABcZANnvpMCNKyncpct+FTiHrcGid4_hpKQvH=DQ=YwD4LFYJA@mail.gmail.com>
	<CAP9ODKqjwDuMNM1aj6TgX6-S10fZC1qBU9O58RdCioTiV0XL-A@mail.gmail.com>
	<CABcZANmU0=Pz7HzaifB1GOJuA2GC4ZQnEyiGy60=Veas9T3-RA@mail.gmail.com>
Date: Sat, 3 Aug 2013 15:37:59 -0300
X-Google-Sender-Auth: 7extaio9XBmJTgn25gIPKAMv8I4
Message-ID: <CAP9ODKqZd=Qjf4n91a-4hMY_hTzmju70U1dd3Vt1is8-ErrHTw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] distro_features_check.bbclass: Allow checking of required/conflicting features
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
X-List-Received-Date: Sat, 03 Aug 2013 18:38:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 3, 2013 at 3:26 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> On Sat, Aug 3, 2013 at 9:55 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> On Fri, Aug 2, 2013 at 6:16 PM, Chris Larson <clarson@kergoth.com> wrote:
>> > On Thu, Aug 1, 2013 at 3:13 PM, Otavio Salvador
>> > <otavio@ossystems.com.br>
>> > wrote:
>> >>
>> >> This add support to list required/confliting distro features for a
>> >> recipe; this avoids user mistake when building recipes/images which
>> >> would not work depending on DISTRO_FEATURES option set.
>> >>
>> >> Adding:
>> >>
>> >> ,----[ Use example ]
>> >> | inherit distro_features_check
>> >> |
>> >> | REQUIRED_DISTRO_FEATURES = "x11"
>> >> | CONFLICT_DISTRO_FEATURES_mx6 = "wayland"
>> >
>> >
>> > I wonder if it would be worth doing this like PNBLACKLIST to let the
>> > recipe
>> > provide its reasoning as a message, or if that would add too much
>> > overhead.
>> > I don't know enough about this use case, but something to consider if it
>> > hasn't been already.
>>
>> I did a look now on PNBLACKLIST and while I see the value of a custom
>> message I didn't come up with a way to do it using overrides as well.
>> So, as the example in the commit log, it'd be harder to make a mx6
>> specific conflict.
>>
>> CONFLICT_DISTRO_FEATURES[wayland]_mx6 = "Vivante GPU driver for
>> Wayland is incompatible with X11"
>>
>> Would the above work with current BitBake code?
>
>
> That's a good point, unfortunately I don't think flags propagate for
> overrides today :(. I think it would be something like
> CONFLICT_DISTRO_FEATURES_mx6[wayland], but I don't think that folds into the
> main variable when the overrides are applied (the semantics of that may be
> unclear0. Oh well, nevermind :)

Yes; or done using code to set it only for specific cases. So I think
it is better to let this as is and put a comment on the code where
using the class /why/ it conflicts/requires it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

