Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.5295.1605279046668316923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rt9KXqqW;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id p8so10211658wrx.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=K4Cq3DZZJlRaLQm1rBcFIxxcZORew5WaDfvLRIHviS8=;
        b=rt9KXqqWh0qGD2CsGVcbPPXh2srISjA8KyXPsDxM/1sVgQA5pd94SpT14QzCs2FFcn
         GJF7WoVQE7lhpqAzXUPWUmbW/CLT65E8LIZjaU3/5WF+SdB6oIjnHnvJkejrOF51JfZ0
         R1J1T1vNq+JaWUs1cFDYItyvl4Fr2nVP3Hn3pxVEhLM0DBOKBiMH5ywdeEUMQ41cO0OP
         W6v2BCh5LdhNjJaD/q6oVjBxvkj7iGQ4+5QZUFfNnzSsiplcojrUwy68Sb2FcD482eH7
         urvCUi+uUx6KZhOkRW1YOO/QJDlYqYEXOyV9HOlqEzJV/dWnz9fz33rywgfNi5z/NN+9
         Swgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=K4Cq3DZZJlRaLQm1rBcFIxxcZORew5WaDfvLRIHviS8=;
        b=EtSXkKgeCdcP/Wje2XhhRGlLCifqrgM5Sb+zvSN60iGGihqAQEcH+48G3EOvjJsiwP
         vy752vG7R8yD0hGUvHcvfrpl7g+R4AFUafGcremt2Uk7OvmcMBeLMv4Q0RBYnTR+pQYE
         5YgBElHAujnRsoZPkCGWZlIQ0gO7ccII/XIfZ9Wtn4s/U0+u3NIDECjFlzQxzDgxdkGS
         u9Ls5FjycyA/Om6iv5QbjnTwm58h/O+C7c+Y6Q3mG51BA4OtDYqJPgygahj5u2qEt+nE
         fpKHjUX+nt/kUDRNmrGj/Ul+TcSzoJf44+U4mKi3xxJEnKMp5+kdriaVtl4hlxM82U8L
         /y0Q==
X-Gm-Message-State: AOAM533PKlubg3Q0dDbtXPCrWyYh43XLIwMQkA5dcj5OitVOEEsEYueC
	Wb89zaqOt0hWi/p+gWDuhZw=
X-Google-Smtp-Source: ABdhPJxpVa4UdeKdQr9VPVz7CPTTSNOuuwJhLf+YIb3HirQuXESJGSnxM60d9hmlBK9LvFpUfzIYaw==
X-Received: by 2002:a5d:4f92:: with SMTP id d18mr4135136wru.118.1605279045267;
        Fri, 13 Nov 2020 06:50:45 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id o63sm10667849wmo.2.2020.11.13.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:50:44 -0800 (PST)
Message-ID: <94ba394eab9d749eb0fdcab230940897bdcd3422.camel@gmail.com>
Subject: Re: [PATCH v3] dbus: split -common and -tools out of main package
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2020 14:50:44 +0000
In-Reply-To: <bb0f046569d419d636a6ca08be6b0b57fa64bfdf.camel@linuxfoundation.org>
References: <20201102180559.1177417-1-luca.boccassi@gmail.com>
	 <20201113104755.1073202-1-luca.boccassi@gmail.com>
	 <bb0f046569d419d636a6ca08be6b0b57fa64bfdf.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-13 at 14:34 +0000, Richard Purdie wrote:
> On Fri, 2020-11-13 at 10:47 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Certain config files and units are shared between dbus-daemon and
> > dbus-broker (available in meta-openembedded), so split them out to
> > allow installing dbus-broker without pulling in dbus-daemon and its
> > dependencies.
> > Stand-alone command line tools can also be used regardless of whether
> > the buses are provided by dbus-daemon or dbus-broker, so split them
> > out into dbus-tools.
> > Finally, move the XML schema files out of the main package and into
> > the development package.
> > 
> > All these changes follow the same pattern used by Fedora, which was
> > one of the first distro to switch to dbus-broker by default:
> > 
> > https://src.fedoraproject.org/rpms/dbus/blob/master/f/dbus.spec
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: fix FILES_ regex to correctly include all units but the sockets
> >     in the main package
> > v3: do not use ${PN} in RDEPENDS, as bitbake expansion is broken and
> >     generates wrong values (eg: dbus-native-common-native)
> 
> Without testing I can tell this will break multilib.
> 
> RDEPENDS and native are a little confusing and tricky, basically due to
> legacy. This is why you'll see RDEPENDS_${PN}_class-native = "" and
> that is probably what is needed here.
> 
> Cheers,
> 
> Richard

Ok, sent a v4, even though I really do not follow - there's already
this in the recipe:

RDEPENDS_dbus_class-native = ""

Also won't that mean that for native builds there's no dependency, thus
breaking the dbus package (the required conf is no longer installed)?

-- 
Kind regards,
Luca Boccassi

