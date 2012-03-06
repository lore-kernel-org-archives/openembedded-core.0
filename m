Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1S4uEH-0007FA-1I
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 14:15:01 +0100
Received: by ghbz2 with SMTP id z2so2078680ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 05:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of slapinid@gmail.com designates
	10.60.4.162 as permitted sender) client-ip=10.60.4.162; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of slapinid@gmail.com
	designates 10.60.4.162 as permitted sender)
	smtp.mail=slapinid@gmail.com;
	dkim=pass header.i=slapinid@gmail.com
Received: from mr.google.com ([10.60.4.162])
	by 10.60.4.162 with SMTP id l2mr11819666oel.3.1331039184556 (num_hops =
	1); Tue, 06 Mar 2012 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Kh+T1thbcBqP1l6+42SCSXIgCxgBhxI+eCQ/V+thytc=;
	b=YYZajeNcjgo3KaF37M7t+BGW7dftMQjqkE+jZLNZTg3dVxY/AKdbT5ksSEZNCt1bOq
	DkQK5FnzvCkEl1KnXYneD0H0CIYsUIgIDI5EXxbjdsdilZz98MQgpBLPOB5iW1FVDMgZ
	kG5y7ykRYKvmaqQWfb/CqWJEzZkJ0rLD2PTWdv4COEF5X+qydgCzUo/1nqcg+Ngvqd0Q
	2dvxDmFxl1NouvuhAyph96K7TOGpGd7bYFKArvclKXDibj5U46CfUvZpz6k+LHFOoGp1
	KqXVM14ISIXni28YiSGk6oD+1vJv9yugZul+xSg7mt5U0No2hFuwo/Q/LRgBNlwUfZrf
	vloA==
MIME-Version: 1.0
Received: by 10.60.4.162 with SMTP id l2mr10034643oel.3.1331039184493; Tue, 06
	Mar 2012 05:06:24 -0800 (PST)
Received: by 10.60.39.39 with HTTP; Tue, 6 Mar 2012 05:06:24 -0800 (PST)
In-Reply-To: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
Date: Tue, 6 Mar 2012 16:06:24 +0300
Message-ID: <CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: broken ncurses support for python
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
X-List-Received-Date: Tue, 06 Mar 2012 13:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 3:08 PM, Sergey Lapin <slapinid@gmail.com> wrote:
> commit dd05e06b89906002f68d616a6326c962e725bc54
> Author: Christopher Larson <chris_larson@mentor.com>
> Date: =A0 Tue Jan 10 13:51:18 2012 -0600
>
> =A0 =A0ncurses-native: install to libdir, not base_libdir

I was wrong with this one, actual culprit is this one:

commit 796c3d038fb7892a5e5206fb10217623de18853f
Author: Scott Garman <scott.a.garman@intel.com>
Date:   Wed Jan 4 22:30:29 2012 -0800


>
> breaks python ncurses support.
>
> Any ideas on proper fixing? For myself I revert this locally and
> everything works perfectly.
> (I think .so files and .a archives should be in usr/lib while .so
> can go to /lib which is not the case with current ncurses.)
> so mv in do_install should be sufficient, not --libdir=3D${base_libdir}.
>
> All the best,
> S.


