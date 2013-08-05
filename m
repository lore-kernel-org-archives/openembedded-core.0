Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9CDF608BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 03:30:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r753UKk0017659
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Aug 2013 20:30:20 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 4 Aug 2013 20:30:19 -0700
Message-ID: <51FF1C59.3000301@windriver.com>
Date: Mon, 5 Aug 2013 11:30:33 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>
References: <CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com>
	<51FF0B8A.9030201@windriver.com>
In-Reply-To: <51FF0B8A.9030201@windriver.com>
X-Originating-IP: [128.224.162.233]
Cc: Chris Larson <clarson@kergoth.com>, "chen_q07@163.com" <chen_q07@163.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Initial review of ChenQi/read-only-rootfs-in-live-images
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
X-List-Received-Date: Mon, 05 Aug 2013 03:30:25 -0000
Content-Type: multipart/alternative;
	boundary="------------030009020300080509080107"

--------------030009020300080509080107
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

For convenience, here's a link below in case people may wondering which 
patchset we are talking about.

  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images


//Chen Qi

On 08/05/2013 10:18 AM, ChenQi wrote:
> Hi Chris,
>
> Thanks for your review and please see comments inline.
> (You might be reviewing the old patchset, please see the new one if 
> you have time.)
>
> On 08/02/2013 11:50 PM, Chris Larson wrote:
>> Greetings,
>>
>> Nice work on this branch. The bind based approach seems clean. I do 
>> have some comments:
>>
>> - I think the read-only-rootfs-hook stuff, at least the bind mounting 
>> piece at a minimum, belongs in a separate script in ${sbindir} rather 
>> than within the startup script itself. This will ease adding support 
>> for r/o to systemd images.
> Although I still hold to the tenet we should make sysvinit and systemd 
> separate from each other whenever possible, this option is acceptable 
> if they do duplicate code and there's no side effect.
> But for now, I would suggest we leave it in the initscripts, and when 
> you add read-only-rootfs support for systemd , you could send a patch 
> to do the change.
>
>> - I think we should consider having an additional script which 
>> unmounts the binds in reverse order, in case the binds prevent 
>> unmounting of the partitions in which they live, potentially causing 
>> an unclean shutdown.
>
> I figure the bind mounts are essentially using volatile storage, the 
> data are lost between reboots after all. So could you please give an 
> example of unclean shutdown?
>
> Another problem with this unmounting mechanism is that it's hard to 
> determine whether a directory is bind mounted. Note that in the 
> read-only-rootfs-hook.sh script, a check has been added to see whether 
> the directory specified in config file is on a read-only partition, 
> and only if so, the directory is bind mounted with a directory on 
> volatile storage.
>
>> - The irda read only bits aren't necessary, it seems. The startup 
>> script writes to /etc/sysconfig/ if its config file doesn't already 
>> exist, as a mechanism of handling default configuration. This is a 
>> terrible way to handle that, and sysconfig is a redhatism, not the 
>> way we do things in our distros. I have a commit I'll submit a patch 
>> for to resolve this by fixing up the startup script.
> This one has been fixed in the new patchset.
>
>> - I think we should enhance the copy part of the bind script in two ways:
>>     - cp from/. to/ -> this ensures it will copy hidden directories 
>> as well, which the wildcard does not
> Agree. Thanks for reminding me of this. I'll fix this.
>>     - handle bind mounts of files as well as directories
> Agree. Thanks. I'll send out a new patchset.
> (Of course I'll first wait for your comments :) )
>
>> - I also think the mount script should support mount options, making 
>> the config files essentially a subset of the filesystem table in 
>> fstab. There are cases where there's value in using options with bind 
>> mounts, and it'd make the scripts potentially more generally useful.
> I know it might be useful, but I can't think of a use case. Could you 
> please give an example where the mount options are useful?
>
>> - I think we should split out the mount and unmount scripts, along 
>> with default configuration, into a separate recipe which inherits 
>> update-rc.d, and which gets pulled into IMAGE_INSTALL by 
>> image.bbclass only when read-only-rootfs is in IMAGE_FEATURES. This 
>> means we'd need less conditional "if this is r/o" code in the 
>> scripts, as we could rely on it being installed in r/o images, and 
>> not in others.
> The r/o check is needed anyway, it's not dedicated to the 
> read-only-rootfs-hook.sh script. Other init scripts might also need 
> this. That's why I made it a common function in the functions script 
> both in initscripts and lsbinitscripts.
>
>>
>> As an aside, I looked into libmount's previous support of fstab.d, it 
>> appears using util-linux's libmount-based mount is supposed to 
>> support passing a directory to its -T/--fstab= argument, which would 
>> let us offload the work to it if we use a real mount binary, but it 
>> seems that this directory argument support doesn't work anyway, and 
>> of course by doing that we'd suck in additional deps, so maybe it's 
>> for the best :)
>>
>> Thoughts? I have prototype mount-binds and unmount-binds shell 
>> scripts here which implement the aforementioned suggestions, but I 
>> wanted to throw my thoughts out to the list for comments before 
>> proceeding any further.
>>
> It would be great if you could share them, and let's have some further 
> discussions.
>
> Best Regards,
> Chen Qi
>
>> Thanks,
>> -- 
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------030009020300080509080107
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">For convenience, here's a link below in
      case people may wondering which patchset we are talking about.<br>
      <pre wrap=""> <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images</a></pre>
      <br>
      //Chen Qi<br>
      <br>
      On 08/05/2013 10:18 AM, ChenQi wrote:<br>
    </div>
    <blockquote cite="mid:51FF0B8A.9030201@windriver.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div class="moz-cite-prefix">Hi Chris,<br>
        <br>
        Thanks for your review and please see comments inline.<br>
        (You might be reviewing the old patchset, please see the new one
        if you have time.)<br>
        <br>
        On 08/02/2013 11:50 PM, Chris Larson wrote:<br>
      </div>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">Greetings,
          <div><br>
          </div>
          <div>Nice work on this branch. The bind based approach seems
            clean. I do have some comments:</div>
          <div><br>
          </div>
          <div>- I think the read-only-rootfs-hook stuff, at least the
            bind mounting piece at a minimum, belongs in a separate
            script in ${sbindir} rather than within the startup script
            itself. This will ease adding support for r/o to systemd
            images.</div>
        </div>
      </blockquote>
      Although I still hold to the tenet we should make sysvinit and
      systemd separate from each other whenever possible, this option is
      acceptable if they do duplicate code and there's no side effect.<br>
      But for now, I would suggest we leave it in the initscripts, and
      when you add read-only-rootfs support for systemd , you could send
      a patch to do the change.<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div>- I think we should consider having an additional script
            which unmounts the binds in reverse order, in case the binds
            prevent unmounting of the partitions in which they live,
            potentially causing an unclean shutdown.</div>
        </div>
      </blockquote>
      <br>
      I figure the bind mounts are essentially using volatile storage,
      the data are lost between reboots after all. So could you please
      give an example of unclean shutdown?<br>
      <br>
      Another problem with this unmounting mechanism is that it's hard
      to determine whether a directory is bind mounted. Note that in the
      read-only-rootfs-hook.sh script, a check has been added to see
      whether the directory specified in config file is on a read-only
      partition, and only if so, the directory is bind mounted with a
      directory on volatile storage.<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div>- The irda read only bits aren't necessary, it seems. The
            startup script writes to /etc/sysconfig/ if its config file
            doesn't already exist, as a mechanism of handling default
            configuration. This is a terrible way to handle that, and
            sysconfig is a redhatism, not the way we do things in our
            distros. I have a commit I'll submit a patch for to resolve
            this by fixing up the startup script.</div>
        </div>
      </blockquote>
      This one has been fixed in the new patchset.<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div>- I think we should enhance the copy part of the bind
            script in two ways:</div>
          <div>&nbsp; &nbsp; - cp from/. to/ -&gt; this ensures it will copy
            hidden directories as well, which the wildcard does not</div>
        </div>
      </blockquote>
      Agree. Thanks for reminding me of this. I'll fix this.<br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div>&nbsp; &nbsp; - handle bind mounts of files as well as directories</div>
        </div>
      </blockquote>
      Agree. Thanks. I'll send out a new patchset.<br>
      (Of course I'll first wait for your comments :) )<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div style="">- I also think the mount script should support
            mount options, making the config files essentially a subset
            of the filesystem table in fstab. There are cases where
            there's value in using options with bind mounts, and it'd
            make the scripts potentially more generally useful.</div>
        </div>
      </blockquote>
      I know it might be useful, but I can't think of a use case. Could
      you please give an example where the mount options are useful?<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div>- I think we should split out the mount and unmount
            scripts, along with default configuration, into a separate
            recipe which inherits update-rc.d, and which gets pulled
            into IMAGE_INSTALL by image.bbclass only when
            read-only-rootfs is in IMAGE_FEATURES. This means we'd need
            less conditional "if this is r/o" code in the scripts, as we
            could rely on it being installed in r/o images, and not in
            others.</div>
        </div>
      </blockquote>
      The r/o check is needed anyway, it's not dedicated to the
      read-only-rootfs-hook.sh script. Other init scripts might also
      need this. That's why I made it a common function in the functions
      script both in initscripts and lsbinitscripts.<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div><br>
          </div>
          <div>As an aside, I looked into libmount's previous support of
            fstab.d, it appears using util-linux's libmount-based mount
            is supposed to support passing a directory to its
            -T/--fstab= argument, which would let us offload the work to
            it if we use a real mount binary, but it seems that this
            directory argument support doesn't work anyway, and of
            course by doing that we'd suck in additional deps, so maybe
            it's for the best :)</div>
          <div><br>
          </div>
          <div style="">Thoughts? I have prototype mount-binds and
            unmount-binds shell scripts here which implement the
            aforementioned suggestions, but I wanted to throw my
            thoughts out to the list for comments before proceeding any
            further.</div>
          <div><br>
          </div>
        </div>
      </blockquote>
      It would be great if you could share them, and let's have some
      further discussions.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <blockquote
cite="mid:CABcZAN=OC=DD4Sxvhf7P-SzmR8kObLceAm4TfKs90uiAqy9Uyg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div style="">Thanks,</div>
          <div>-- <br>
            Christopher Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Maintainer - Tslib<br>
            Senior Software Engineer, Mentor Graphics </div>
        </div>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030009020300080509080107--
