Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.18470.1586968842965276048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 09:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YDaKo2tR;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id f2so3936084ilq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a1BugqVIqYznYDW3l3EzlsbUJ9WNKdyRI6xKxFZxxLQ=;
        b=YDaKo2tR4mvI2GNtdyF3WoVkiD7gVtERKVehbDbq6vAelG3y9+1lVCIQwNRma43XCN
         bNzoYkrxmwVen8jTznArCcE8AO3QW8Tstvs1HVlqfWRDZ1cpb+4FxflYWfh6zqU9AIDw
         oGHr63x3w5gcYc5C5m8Cp2mlMVGoMFSx1i+yoFxvyKrlWY6p/tJfqdv5bIJNjOeVNJb8
         G8KeQ5gv3tZKJBoz12gGQV1ylAC0xo4GHeJxLTpAdVrW6ioPa+oxyAokAiz0pQ0gp4rh
         NBNoSvlmNCvEF02+9f4Tqb9psCsTyMUbi7W4/6GZUTEE9W/PLTt9jmYDa8yppIqEE8OB
         jRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a1BugqVIqYznYDW3l3EzlsbUJ9WNKdyRI6xKxFZxxLQ=;
        b=F6aMy56WfVACsUng0xaZtQsg1cSIGGqosdD2QWYmcYWEq6wKkUyG/o5n8v7UjV5nCe
         QlnJ+NhaWxRpriwrDRgo+M8S3di1QNY+x/CdLy7RqjNAexgFog5Wk/RwK8UhPplrYDAK
         ZlDVLu44aBAL48UlQR77dz34hcpPJpZhFMDekSQWRiU20/U/cUpDputF7MBfCWv8HFku
         WMYi+nPfxmxEZoibulH/33loXczC+AOqb0s7CVwchzxaQwkZJ3XmcUnNo9jvD8TdofKD
         6WJ6a4LZSwWpo5VGeIg/61tWMCbvNgHe/t2eDJjhwIXA5chEXzAIhYrllVUTYemO5+wz
         GLKA==
X-Gm-Message-State: AGi0PualtHddl3cJuoPyyL/iRFntx2hXF36DFLB7v7wxVSLdeYD30I+4
	yPMaenjon0yREWEFCZgm8eXQpQLT2XemSrLhXI4=
X-Google-Smtp-Source: APiQypJhpFQgjeGq1KRUNmZHRUt6XvEKcvYKgKRzh3TS+DfB4BOawpjCwxwcACiZskM59HgKqtGYEj7qgF5VXi7Dpgo=
X-Received: by 2002:a92:985d:: with SMTP id l90mr6489063ili.108.1586968842389;
 Wed, 15 Apr 2020 09:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRSvxc-Vv3YwJR0xGGQBNmU9NA3V4zCPZfQb17heZhi-cQ@mail.gmail.com>
 <CAAnfSTu17U9n7T7xE-gNszkscbC-_T-WovUP-o_NpD4_uYF4yg@mail.gmail.com>
In-Reply-To: <CAAnfSTu17U9n7T7xE-gNszkscbC-_T-WovUP-o_NpD4_uYF4yg@mail.gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Wed, 15 Apr 2020 18:40:31 +0200
Message-ID: <CALbNGRTDnJPeqRLN7AwtNUrBknVkPNVDS9f=7xopk-vRnVYv5A@mail.gmail.com>
Subject: Re: [OE-core] Meson host_machine.system() incorrect on ARM?
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 15, 2020 at 4:20 PM Ross Burton <ross@burtonini.com> wrote:
>
> On Wed, 15 Apr 2020 at 01:47, Andreas M?ller <schnitzeltony@gmail.com> wrote:
> > Am testing it currently but what do experts think of
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index 06034e8b47..167263f76c 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -68,6 +68,9 @@ def meson_operating_system(var, d):
> >      os = d.getVar(var)
> >      if "mingw" in os:
> >          return "windows"
> > +    # avoid e.g 'linux-gnueabi'
> > +    elif "linux" in os:
> > +        return "linux"
> >      else:
> >          return os
>
> Looks right.  The canonical table of OS names for Meson is here:
>
> https://mesonbuild.com/Reference-tables.html#operating-system-names
^ Thanks - was looking for that exactly that. Will send out a patch soon

> There's an argument to be made for validating the OS name is in that
> list before returning it from meson_operating_system.
^ I read this several times - but am not sure if understand it
correctly: Do you mean it is not correct/expected that meson accepts
an incorrect name?

Andreas
>
> Ross
