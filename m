Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C85C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:35:27 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.2409.1643826927305220649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=RNTp6FIs;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.233] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8996120B6C61;
	Wed,  2 Feb 2022 10:35:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8996120B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1643826926;
	bh=fxLijVEBsU/ldXEHRk8i3UgKn+rEVbtY1zA98yceu+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RNTp6FIsF1dLz03FnKxWk8Un7rh9k1cLEFDqdHRF3KEKTEb4iExhrDFTN20LVExN1
	 sCt2Vywab5l88NRS+P5QGLZKb3vAVad5L72xtrCjFhxAxIngP/M9rwAjSokbwV8Bwc
	 RPsy6y+5OG5kaZxZfKGl0uWVBHEA1Im6bzpi+Q1g=
Content-Type: multipart/alternative;
 boundary="------------CXoX0FXB2EDzpFhHkgQJvWMO"
Message-ID: <30ead24a-3da4-351d-a4b8-edce9622651b@linux.microsoft.com>
Date: Wed, 2 Feb 2022 18:35:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: Add overlayroot module
Content-Language: en-US
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
References: <20220129194839.3280002-1-alhe@linux.microsoft.com>
 <10c1ea08-3b69-aeef-6052-41ad98f37ce6@gmail.com>
 <ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com>
 <193aad3a-ef93-fb74-7a9e-a6fe799d5778@gmail.com>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <193aad3a-ef93-fb74-7a9e-a6fe799d5778@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161260

This is a multi-part message in MIME format.
--------------CXoX0FXB2EDzpFhHkgQJvWMO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/22 08:15, Vyacheslav Yurkov wrote:
> Hi Alejandro
>
> On 02.02.2022 07:58, Alejandro Hernandez wrote:
>>
>> Hey Vyacheslav,
>>
>> ...I definitely tried extending the overlay-etc class but it simply 
>> does not work for this, since the rootfs becomes inaccessible once 
>> the system has booted, ...
>>
>
> That's what I meant. What if we added another parameter, let's say 
> OVERLAY_OLDROOT_MOUNT. If it's set, then lower layer can bind mounted 
> to that mount point. In that case -etc part of overlayfs-etc has to be 
> changed for something else, of course, to make it more general purpose 
> class. Perhaps overlayfs.bbclass can be renamed to 
> overlayfs-systemd.bbclass then?
> What do you think?
>
This is precisely the way I implemented it first, I wanted to use the 
overlay-etc class as general purpose, but sadly that doesn't work for 
this flow as its explained in the script comments, using it in that way, 
the / overlay can be mounted, however its impossible to access its 
original contents once we chroot in the overlay, hence why this belongs 
in initramfs-framework as a separate feature from the class, the 
intention is not to replace the class which provides different 
functionality.


>> ... but it is a different use case and boot flow so I believe both 
>> can co-exist for different workflows depending on the user needs...
>
> My concern here is code duplication :) If we find an issue in one 
> place, we would need to change it in two places.
>
> Thanks,
> Vyacheslav
>
>> Cheers,
>>
>> Alejandro
>>
>
--------------CXoX0FXB2EDzpFhHkgQJvWMO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/2/22 08:15, Vyacheslav Yurkov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:193aad3a-ef93-fb74-7a9e-a6fe799d5778@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">Hi Alejandro<br>
        <br>
        On 02.02.2022 07:58, Alejandro Hernandez wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p><font face="Courier New, Courier, monospace">Hey Vyacheslav,</font></p>
        <p><font face="Courier New, Courier, monospace">...I definitely
            tried extending the overlay-etc class but it simply does not
            work for this, since the rootfs becomes inaccessible once
            the system has booted, ...<br>
          </font></p>
      </blockquote>
      <br>
      That's what I meant. What if we added another parameter, let's say
      OVERLAY_OLDROOT_MOUNT. If it's set, then lower layer can bind
      mounted to that mount point. In that case -etc part of
      overlayfs-etc has to be changed for something else, of course, to
      make it more general purpose class. Perhaps overlayfs.bbclass can
      be renamed to overlayfs-systemd.bbclass then?<br>
      What do you think?<br>
      <br>
    </blockquote>
    <p>This is precisely the way I implemented it first, I wanted to use
      the overlay-etc class as general purpose, but sadly that doesn't
      work for this flow as its explained in the script comments, using
      it in that way, the / overlay can be mounted, however its
      impossible to access its original contents once we chroot in the
      overlay, hence why this belongs in initramfs-framework as a
      separate feature from the class, the intention is not to replace
      the class which provides different functionality.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:193aad3a-ef93-fb74-7a9e-a6fe799d5778@gmail.com">
      <blockquote type="cite"
        cite="mid:ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com">
        <p><font face="Courier New, Courier, monospace"> </font></p>
        <font face="Courier New, Courier, monospace">... but it is a
          different use case and boot flow so I believe both can
          co-exist for different workflows depending on the user
          needs...<br>
        </font></blockquote>
      <br>
      My concern here is code duplication :) If we find an issue in one
      place, we would need to change it in two places.<br>
      <br>
      Thanks,<br>
      Vyacheslav<br>
      <br>
      <blockquote type="cite"
        cite="mid:ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com"><font
          face="Courier New, Courier, monospace"> </font>
        <p><font face="Courier New, Courier, monospace">Cheers,<br>
          </font></p>
        <p><font face="Courier New, Courier, monospace">Alejandro</font><br>
        </p>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------CXoX0FXB2EDzpFhHkgQJvWMO--

