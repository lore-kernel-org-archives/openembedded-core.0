Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UV0XU-0004c0-Fv
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:19:34 +0200
Received: by mail-vc0-f180.google.com with SMTP id m17so1766208vca.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=D6pvbxLwUGv4XmPgAAsLQIvben6rj3/vETSd4uFq1xw=;
	b=K6At0ttDaY8TVDiS0REOluGC1QL8izX7bQ/XPB6AlMGE7xwNU+pSyyyA29CN0qayvt
	F2Ar8zFAQMgDrhU9Q72Chas+91QV1Zzd3k7f62MbbR20Ppvpt6K4aBsZlWuxc0D8iN8+
	ZeSaECgIgNLr7CU1DYgHt2Yz27DACjSxqIg3xMuExMKhqcbmQz8nIMx/MUmBrY8GryiJ
	0csolH4YdONmuaQ/dJ9F2d9pOMprm+vwAHIEZAFJ69NX2H5ZZ9RJHc6xV4MSrg3ioeCO
	tU5mz6ucxn5cCkYKtVO1a014IWuHokAzVBvF7yKhEsSmyINTroXQem+P4zjqbAuI8o5r
	ppbA==
MIME-Version: 1.0
X-Received: by 10.52.33.236 with SMTP id u12mr21149967vdi.101.1366812076349;
	Wed, 24 Apr 2013 07:01:16 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Wed, 24 Apr 2013 07:01:16 -0700 (PDT)
In-Reply-To: <1593024.LqG1OqkOga@helios>
References: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
	<1593024.LqG1OqkOga@helios>
Date: Wed, 24 Apr 2013 16:01:16 +0200
Message-ID: <CALbNGRQYcQFFaqi+cgRR8mvrtOhaB_prdgwAV0p9gSdwGnORKA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst questions (was postinst does not finish)
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
X-List-Received-Date: Wed, 24 Apr 2013 14:19:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 3:21 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 24 April 2013 14:04:39 Andreas M=C3=BCller wrote:
>> as written before: an 'exit 1' within recipe's postinst causes
>> trouble. E.g meta-oe's lxdm does not run systemd.bbclass' code which
>> leaves lxdm in unprepared condition causing start too early and ending
>> in unfinished postinstall.
>
> I think the way forward with this is to avoid doing this at all - let's t=
ry to
> get as many of these postinstalls working on the host. Looking at the
> postinstall in the lxdm recipe in meta-oe, I can't see anything that coul=
dn't
> work on the host - $D would just be needed in front of ${libdir} and
> ${localstatedir}.
>
>> A simple workaround for this (we should think of something else later)
>> would be to prepend postinst code within systemd.bbclass (and maybe
>> others too) instead of appending. Hereby we ensure that the code is
>> executed independent of recipe's code. First question: Any objections?
>
> As long as there's no reliance within systemd.bbclass upon anything that =
a
> recipe's custom postinstall might be doing - this could be problematic fo=
r
> example if the custom postinstall were configuring a service which would =
be
> automatically started as a result of the systemd postinstall (not sure if=
 this
> is how this ends up operating without trying it, but you get the idea.)
>
> Cheers,
> Paul
>
The more I look into all this I think we need a rework on the
pre/post/inst/rm stuff:

* exit allover - nobody can tell which code gets useless
* shebang is only found for recipes inheriting classes taking care..

Andreas


