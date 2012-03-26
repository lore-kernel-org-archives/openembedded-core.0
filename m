Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SC8Tg-0001xi-Ln
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:52:48 +0200
Received: by iaag37 with SMTP id g37so8803323iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=S16jipDfrQUg6GfeNr/0vDiSBTHZFlyuBb1QfZJGC3I=;
	b=nIX6rRdashUoGlfe00Yh3d8XNOEiYPY6SNnu1fOTwC3fEsSkHOGgM16t6qlkJSAipk
	sFNZrKudkbl4OuaKp2AQKhFY/zfpRTc15Y3SJEPfTcX0D/nfSK7tEHifydcDfQtdV3wC
	i2OKP9M0eQv6eJWHSy+bZf/mJihzR2o6utEPH37axqaK2GJ3Uv6N7Bp3KF5kmOLA3lIL
	gimm7THTb4bpg6OdtUTzOEVio6pj0dz4KURvsNiKcsvuMhsYSpUZrJcGz/g3ENrQPOJx
	hQFpvtQVB6cxLAGa5ZJzOqnCpKKr6uBsN0BPp2YU0FAzihVmjJIHkp/RyvIrQW2Y4h6i
	eeHg==
MIME-Version: 1.0
Received: by 10.42.72.130 with SMTP id o2mr14642255icj.8.1332762228557; Mon,
	26 Mar 2012 04:43:48 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Mon, 26 Mar 2012 04:43:48 -0700 (PDT)
In-Reply-To: <1332753590.28414.94.camel@ted>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
	<1332504745.9740.398.camel@ted>
	<CALbNGRT8Wb2gt7un4efD+szwz3kPZ5pns-4G6EusspH5iYYuZA@mail.gmail.com>
	<1332545863.9740.477.camel@ted>
	<CALbNGRTvipVQoipZFeuAwFcCr5APdzBh4jWm-sgn6c9hXs87+w@mail.gmail.com>
	<1332753590.28414.94.camel@ted>
Date: Mon, 26 Mar 2012 13:43:48 +0200
Message-ID: <CALbNGRQXm_xah+101xFMk=wxFYck8GEnW3-O0Y6ynQ+p0AD8kw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
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
X-List-Received-Date: Mon, 26 Mar 2012 11:52:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 26, 2012 at 11:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> > There are two problems:
>> >
>> > a) Knowing these are postinstalls at first boot and not package installs
>> > b) Deleting the unused "lock" files afterwards
>> >
>> > You'd therefore probably have to add something to the postinstalls core
>> > which:
>> >
>> > a) Creates some file during final rootfs postinstalls on first boot
>> > b) Clears some set of files after first boot.
>> Isn't this exactly what we are doing?
>> >
>> > I don't see a major issue with doing either of these two things though
>> > and it would simplify your patch whilst also allowing other similar
>> > cases to work in a similar way.
>> >
>> We presented a working solution fixing an issue existing for long time
>> and don't see that this suggestion gives major enhancements. Feel free
>> to present a different solution.
>
> Right, what I'm trying to figure out is whether we can simplify that
> implementation a little so we don't need a new recipe, dependencies and
> a new init script. There is nothing wrong with that solution but I think
> its possible to simplify things a little.
OK - you are looking for a more generic approach (next candidate might
be mime.bbclass/update-mime-database). Without taking care of how /
where / by whom a framework for runonce-functionalty is going to be
implemented - how about:

 * Each class/recipe requiring runonce functionality adds code
snippets by appending into a global variable. For
gtk-icon-cache.bbclass something like

<snip>
gtk-update-icon-cache-runonce = " \
gtk-update-icon-cache-runonce() {
    for icondir in @datadir@/icons/* ; do \
        if [ -d $icondir ] ; then \
            gtk-update-icon-cache -fqt $icondir
        fi
    done
}
"

# online
RUNONCE_TASKS += "gtk-update-icon-cache-runonce"
# offline - requires gtk+-native
# RUNONCE_TASKS_OFFLINE += "gtk-update-icon-cache-runonce"

gtk_icon_cache_postinst() {
if [ "x$D" != "x" ]; then
        exit 1
fi

# after 1st boot
if [ ! -e ${sysconfdir}/init.d/runonce ]; then
    ${gtk-update-icon-cache-runonce}
fi
}
<\snip>

* In case the global variable RUNONCE_TASKS is not empty, the
framework creates one systemwide initscript (
${sysconfdir}/init.d/runonce ) + systemd-service ( we sent systemd
implementation for gtk-icon-update approach in meta-oe [1] ). The
contents of this script are the snippets and code to delete itself and
systemd-stuff. Since the code snippets are identified by a name ( here
gtk-update-icon-cache-runonce ), it is no problem to ensure that each
snippet is added only once.
* In case RUNONCE_TASK_OFFLINE  is not empty,  the framework creates
one script with similar contents. This is called after
offline-postinst. If we decide to have gtk+-native in oe-core, we
could do gtk-icon-update offline ( as Koen suggested ).

> My worry is whether the simplifications I have in mind will work in the
> systemd world :/.
See above

Andreas

[1] http://patches.openembedded.org/patch/24181/


