Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
 by mx.groups.io with SMTP id smtpd.web11.6148.1616489411360359128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 01:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=Viu79F1R;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.16, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1616489408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YxXsTNUg/3KcIB5ah9E896NqFjUEu6mqdwNY+g8FhYOG6DWZsFdf7z+e4ukejVu1CY68dCJh2nnlQLP+mgZkZBiBO3T18swrlKzjsBc5AHm11olpogessn3ociQnj8LV4U+ntqXkqTDfN01V2OOGH9eKIGJ1UWV4pETqhqQb3Ww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1616489408; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=zLpxJwgW9Kp9nIAJ0raUd860ziA2efv5IUGRp0Msk5U=; 
	b=CkVUoj8h7EZnxa6FrLWzgUhblN+hfpknuCoj8UFhkhr2j1dh8zSIjfG/wp6PLq00Qhn03Ns81ebhwzklQx1td7RJu5szTPLYNrryaHm0ZwBk6ufGWGXpi8GA2jhQcYW2ADiTZ+is4gLlYKCV7NG8ppfzCNEgjTGCmgF2NwKwTdc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl> header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616489408;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zLpxJwgW9Kp9nIAJ0raUd860ziA2efv5IUGRp0Msk5U=;
	b=Viu79F1R71/kg88+8y0rlfyXhl6VTvMSHBi+l1QrK8BhkQx7ZptXPbI20T9Je0vM
	9ckGYjgE9A7qvnfb/VDsBWXkKF80KWE/MIvyrDJLOhxtJP15E+OAzU1r/nD/SkPwM1J
	nb+E5B154FLhaq1saVv3iWcSYoJ5ffW/CQLIPOzg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1616489405237205.9643015016003; Tue, 23 Mar 2021 01:50:05 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:50:05 +0100
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Andre McCurdy" <armccurdy@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	"OE Core mailing list" <openembedded-core@lists.openembedded.org>
Message-ID: <1785e46db1e.bbb06229658121.7144680434793210206@ertelnet.rybnik.pl>
In-Reply-To: <CAJ86T=VmDYxS5PjHazGUZD_NXeqsJ+uo=nmveGJjJrocyPVvng@mail.gmail.com>
References: <5a2c7beb-bc46-5528-c84-122ea0799c29@crashcourse.ca> <CAJ86T=VmDYxS5PjHazGUZD_NXeqsJ+uo=nmveGJjJrocyPVvng@mail.gmail.com>
Subject: Re: [OE-core] curious about weirdness in some FILES_${PN} settings
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Mon, 22 Mar 2021 20:27:42 +0100 Andre McCurdy <armccurdy@gmail.com> wrote ----
 > On Mon, Mar 22, 2021 at 11:43 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
 > >   (warning: i've just been handed an existing OE code base, and i'm
 > > going to ask some questions about some head-scratching things i'm
 > > finding in it, so be prepared for weird questions.)
 > >
 > >   in one recipe, i see the following snippet:
 > >
 > >   FILES_${PN} += "/etc"
 > >   FILES_${PN} += "/etc/mosquitto"
 > >   FILES_${PN} += "/etc/mosquitto/config"
 > >   ... etc etc ...
 > >
 > > first, i'm taken aback by the hardcoding of "/etc" rather than using,
 > > you know, "${sysconfdir}", so i'm *assuming* that unless someone was
 > > doing something spectacularly clever here, that just can't be right.
 > 
 > Nothing clever going on, it's just a bug. In general, using /etc
 > instead of ${sysconfdir} etc will appear to work fine until you add
 > BBCLASSEXTEND and try to build <recipe>-native, at which point things
 > will start to fail in mysterious ways (since native.bbclass over-rides
 > the default values of ${sysconfdir} etc).
 > 
 > In this particular case, you might still get away with it since
 > FILES_${PN} is related to packaging and -native recipes don't do any
 > packaging but it's still not right.
 > 
 > >   more to the point, the above seems redundant -- once you've added
 > > "/etc", isn't the rest just superfluous? i'm not sure what the
 > > original developer was going for here. thoughts?
 > 
 > Yes, and even beyond that, ${sysconfdir} is handled by the default
 > packaging rules, so any extra packaging rules related to adding files
 > from /etc to the default package are redundant.
 > 
 > >   finally, if i wanted to add all of some directory, say "dir", it was
 > > my understanding that all of the following were equivalent (hmmmm,
 > > short of picking up hidden files, i guess):
 > >
 > >   dir
 > >   dir/
 > >   dir/*
 > >

Normally in the RPM world it matters if you gonna own a directory with all files in it
or just the directory or the file inside the directory but not the directory itself.
You can read more about it in  Fedora packaging guidelines "Unowned Directories"[1].

However, I'm not sure how this is implemented in yocto/bitbake if at all, as I couldn't find any
similar recommendation in [2]. You can always check who owns what using rpm tools like rpmls, rpm -qlv

Here is the real example from Fedora where the directory is owned by different package then
files inside a folder:

$ rpm -qf /etc/sysconfig/
filesystem-3.14-2.fc32.x86_64

$ rpm -qf /etc/sysconfig/atd
at-3.1.23-4.fc32.x86_64

This means that 'at' package doesn't need to create '/etc/sysconfig' directory and conversely removal of the
'at' package will not remove the '/etc/sysconfig' directory even if it was empty.

[1] https://docs.fedoraproject.org/en-US/packaging-guidelines/UnownedDirectories/
[2] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-FILES

--
Regards,
Damian


 > > my personal preference would be "dir/", as it gets across the idea
 > > that "dir" is a directory and i want all of it. thoughts on that as
 > > well? i'm currently perusing the OE code base to see the general
 > > consensus on this. is there one?
 > 
 > That's more a question of coding style, which the OE maintainers etc
 > generally doesn't care about very much (unless you start asking about
 > unifying oe-core and meta-oe with respect to indenting with tabs or
 > spaces...).
 > 
 > >   more decidedly strange questions coming shortly ...
 > >
 > > rday
 > >
 > >
 > > 
 > >
 > 
 > 
 > 
 > 
