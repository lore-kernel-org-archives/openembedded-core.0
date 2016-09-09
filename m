Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF456E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 18:10:15 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s29so3018446lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=exW4jwiJO07aEv0JbvXupjr5Wa1JllJJc4m3BqloPEc=;
	b=irrE7CeQM/LORSoWLMDFIWIUhYMYDdNaLXzsIJTg9SN5tIVyqhBWRRrnDdpCwfMnLr
	Mj2sn/Z27oMMfT6hZvC2aElkFyd4d8qioPlr+2HGOK+2Q2Ery9c7RnD88ewOjnyCCeDG
	FaSGHUzQKCgR8AGPQMWNOp+g9WzxHEmx64eICuOF/eWvwonZotAPyGuOxeKFM2x2mhUB
	2F5tUnIIPJoPAYbmrwQxJ5L5qUof5cSpggkxpG3vIr2vIIQuBC3pVT1A8c+X5xBk1F5C
	OSnNiNSXCrwhinRFADLnJMgE57RsWJCrbzEGsssQ92sHCo8tEPCxH3Zsz0fWzSQKzS2Y
	9kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=exW4jwiJO07aEv0JbvXupjr5Wa1JllJJc4m3BqloPEc=;
	b=E1zlPtgADIloc1wsd08fHTBM0cG02ssAae/thfSyZbgyJa3rDBQB2qg9Eq0fKOIPqu
	U7R3U0C5scY8RtdW2HXoQyj8pikYpETukczjuL/fxpp+pNhTRH4HaQM9+f551DahmY6n
	3JQWNmubCpx6Y9aWgm/upBiH2wnRVOJAOg4BsRsoMZDr50zF28D3lp4zpiJfu9LEUKY6
	mtSeoHToQdQStFYrmqVLle4iXsxkY8vIu5CHamU5gAwOj7G/YnuTR1Buppa/LgYGl1W/
	IZgbUuJ1AiQkdX4yAqZznEk/K2k91JRJfn3snPDLkhITyA9z5BBG4FkeQwJwOq1v5T9q
	NzLA==
X-Gm-Message-State: AE9vXwOWMxyJLWndo8SmIcKGeH7TxLKjuBpjCs/0YLcj2IGwIhppKCwJCvlmouBo7bNfbfSHLuf15JW2KP2NfQ==
X-Received: by 10.25.160.6 with SMTP id j6mr1668987lfe.159.1473444614763; Fri,
	09 Sep 2016 11:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.85.200 with HTTP; Fri, 9 Sep 2016 11:10:14 -0700 (PDT)
In-Reply-To: <1473333722.3099.33.camel@iki.fi>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<72f9c03cf7bb25482acc9c40b775a4f294e772b6.1473240119.git.Qi.Chen@windriver.com>
	<CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com>
	<57D10664.3050007@windriver.com> <1473333722.3099.33.camel@iki.fi>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Fri, 9 Sep 2016 20:10:14 +0200
Message-ID: <CAEGpDuY+WMMmwZ1b99zA1zCYrAke8pnUyG3B03dummFU6=PN0Q@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>, Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] pulseaudio: fix to manage user services corretly
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
X-List-Received-Date: Fri, 09 Sep 2016 18:10:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I think I didn't express myself correctly. Please note I did the
longer investigations quite a while ago and I'm mainly talking from
memory, so I may be wrong in some of the assumptions.

From systemd.bbclass, you can see this:
            if service.find('.socket') != -1:
                # for *.socket add *.service and *@.service
                service_base = service.replace('.socket', '')
                systemd_add_files_and_parse(pkg_systemd, path,
service_base + '.service', keys)
                systemd_add_files_and_parse(pkg_systemd, path,
service_base + '@.service', keys)


So, for installation purposes, no .service is required in
SYSTEMD_USER_SERVICE. Setting it .socket should also install (but not
enable) the .service file together with the .socket one into the
image, as actually the .socket one usually depends on the .service
file at runtime.

That being said, of course it's not the same behavior if you add only
one of them, the other or both:
1- Adding only .service -> It will install + enable the .service
2- Adding only the .socket -> It will install both. It will enable .socket
3- Adding .service + .socket -> It will install both. It will enable both.

Usually, you want either only the .service to be enabled (1, which
will start it automatically at startup of user session), or only the
.socket enabled (2, which will start only the socket at startup of
user session, and only start pulseaudio process when required by some
pulseaudio client). The third case, that is, installing + enabling
both is usually not a good idea, at least it makes no sense to me.

So, we should consider only "1" or "2". I would personally go for 2nd
option, and probably disable pulseaudio own autospawn system as
explained by Tanu. This way we don't start pulseaudio unless when it's
actually needed.

That is:
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.socket"

And by the way, you  should be able to remove
"${systemd_user_unitdir}/*" from FILES_${PN}-server as it should be
handled automatically by systemd.bbclass. If that's not the case, then
probably there's some error in systemd.bbclass you should look into.

Hope I explained myself better now. Regards!


2016-09-08 13:22 GMT+02:00 Tanu Kaskinen <tanuk@iki.fi>:
> On Thu, 2016-09-08 at 14:34 +0800, ChenQi wrote:
>> On 09/07/2016 06:29 PM, Pau Espin Pedrol wrote:
>> >
>> >
>> >
>> > Pau Espin Pedrol
>> >
>> > 2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com
>> > <mailto:Qi.Chen@windriver.com>>:
>> >
>> >     Make use of the new SYSTEMD_USER_SERVICE variable added in
>> >     systemd.bbclass
>> >     to manage user services in pulseaudio-server package.
>> >
>> >     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>> >     <mailto:Qi.Chen@windriver.com>>
>> >     ---
>> >      meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
>> >      1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> >     diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> >     b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> >     index 6ed79ef..f3754d7 100644
>> >     --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> >     +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> >     @@ -124,8 +124,8 @@ FILES_${PN}-conf = "${sysconfdir}"
>> >      FILES_${PN}-bin +=
>> >     "${sysconfdir}/default/volatiles/volatiles.04_pulse"
>> >      FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-*
>> >     ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules
>> >     */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
>> >
>> >     -#SYSTEMD_PACKAGES = "${PN}-server"
>> >     -SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
>> >     +SYSTEMD_PACKAGES = "${PN}-server"
>> >     +SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.service
>> >     pulseaudio.socket"
>> >
>> > I think specifying "pulseaudio.socket" for
>> > SYSTEMD_USER_SERVICE_${PN}-server should be enough, systemd.bbclass is
>> > going to add the .service file afair.
>>
>> Add both:
>> chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls
>> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user
>> default.target.wants  sockets.target.wants
>>
>> Add pulseaudio.socket:
>> chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls
>> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user
>> sockets.target.wants
>>
>> They have different results.
>> I don't know a lot about pulseaudio. Can you confirm that
>> pulseaudio.socket is enough?
>
> If I understood correctly, Pau's argument was that there would be no
> difference, which doesn't seem to be the case. However, if
> pulseaudio.service isn't included in default.target.wants, that
> shouldn't be a big problem, because socket activation will anyway start
> the service when needed. On the other hand, I don't
> think SYSTEMD_USER_SERVICE is intended to be used for controlling which
> units to enable - it looks more like a variable that should contain all
> units contained in the package. If my understanding is correct, you
> should list both units in the variable.
>
> The distributions that I've seen to use systemd to manage pulseaudio
> only enable pulseaudio.socket, so that socket activation is used rather
> than starting pulseaudio automatically as part of the user session. I
> don't know if OE supports that - it looks like there's only a toggle to
> enable all units or none. Other distributions also patch client.conf to
> disable pulseaudio's own autospawning mechanism, since it's redundant
> when using socket activation. Leaving autospawning enabled shouldn't
> break anything in normal use, but it can cause some confusing behaviour
> if the user tries to manually disable automatic pulseaudio starting by
> disabling the systemd units.
>
> --
> Tanu
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

