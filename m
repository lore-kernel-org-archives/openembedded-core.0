Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E331D6065F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 02:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6P2pnpp020216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 19:51:49 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 24 Jul 2013 19:51:48 -0700
Message-ID: <51F092C5.3060906@windriver.com>
Date: Thu, 25 Jul 2013 10:51:49 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
In-Reply-To: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Thu, 25 Jul 2013 02:51:49 -0000
Content-Type: multipart/alternative;
	boundary="------------090105030706030308000407"

--------------090105030706030308000407
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chris,

I'm now working on some bugs related to read-only rootfs.

You can get more information from the bug link below. The related bugs 
are listed in the blocks list of this bug.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103
You can also review the patchset for these bugs on

http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images


I'm really interested on this topic. From my understanding, this RFC 
mainly focuses on read-only rootfs support for systemd based images, right?
I've read though this thread carefully, but still can't get a clear 
picture about this RFC.
Could you please give me a link to your patchset, if convenient?

Best Regards,
Chen Qi

On 07/25/2013 02:54 AM, Chris Larson wrote:
> Greetings all,
>
> I've recently been doing some work at Mentor Graphics on 
> read-only-rootfs, for our purposes, and have done some things which I 
> think may be of use. I'm looking for comments/thoughts on the approach 
> and potential use of a pattern generally, and also wish to discuss the 
> volatiles vs tmp files.d situation.
>
> I have recently created a `meta-ro-rootfs` layer to hold work in this 
> direction which is not yet in or-core. As is fairly usual, it's a 
> staging area between us and upstream, not a place for anything to live 
> permanently. What follows is a summation of the work done there thus far:
>
> - Created a 'systemd-tmpfiles' recipe for non-systemd builds, and also 
> for native
>
>   - Patched in --sysroot= support for systemd-tmpfiles, to facilitate 
> running it up front against the filesystem at do_rootfs time the way 
> read_only_rootfs_hook does with populate-volatiles
>
>   - Added an 'update-tmpfiles' script, which iterates over all files 
> in /etc/default/volatiles/, converting them to tmpfiles.d config 
> files, writing them into /usr/lib/tmpfiles.d/, and removing the 
> volatile config files
>
>   - Reduced the dependencies, via patches and EXTRA_OECONF, as much as 
> seemed to be viable
>
> - Split out 'systemd-tmpfiles' from 'systemd' package in the main 
> systemd recipe, equivalent to the standalone one, for builds with 
> `systemd` in DISTRO_FEATURES
>
> - Created a 'read-only-rootfs-systemd' bbclass, which appends the bits 
> to run both update-tmpfiles and systemd-tmpfiles against the 
> filesystem at do_rootfs time for systemd distros. This will need to be 
> altered to not remove the volatiles config files for non-systemd 
> *images*. I realize there are many use cases to consider in the 
> sysvinit vs systemd realm, and I haven't verified that all are 
> satisfied just yet, as systemd is our current priority for r/o rootfs.
>
> - Added a COMPLEMENTARY_GLOBS config (in the layer.conf for now, 
> though I may move it into the bbclass) which adds `pkg-volatile` for 
> each `pkg` to the rootfs if read-only-rootfs is enabled.
>
> - Implemented a prototype configuration for dbus which uses this to 
> support read-only-rootfs. In the main package, we install a dbus.conf 
> into /usr/lib/tmpfiles.d/ which ensures /var/lib/dbus exists for the 
> non-r/o case, without including the path in the package (as including 
> paths within volatile paths in a binary package will break things). In 
> the dbus-volatile package, I install a different dbus.conf to 
> /etc/tmpfiles.d/, which overrides the one in /usr/lib/tmpfiles.d/ 
> (yes, update-alternatives would have been an option too, and has a 
> certain amount of merit, as /etc/tmpfiles.d/ is supposed to be 
> reserved for use by the administrator), and this config ensures that 
> /var/volatile/lib/dbus is created and that /var/lib/dbus is a symlink 
> which points to it.
>
> I have confirmed that I can create a systemd image with 
> read-only-rootfs and read-only-rootfs-systemd inherited, and dbus is 
> able to write to the volatile /var/lib/dbus/ path.
>
> I think this is a step in the right direction, though clearly more 
> needs to be worked out, but this pattern of using override 
> volatile/tmpfiles configurations with an additional complementary 
> package should let us cleanly share binary packages between r/o and 
> non-r/o images.
>
> Now, regarding tmpfiles.d vs volatiles. This is a rather unpleasant 
> situation currently, as for a recipe to cleanly support both sysvinit 
> and systemd images, it needs not only both sysv init script and 
> systemd services (though admittedly the latter is optional with sysv 
> compat), it also needs to provide both a volatiles config and a 
> tmpfiles.d config if it needs volatile paths.
>
> The standalone systemd-tmpfiles recipe I've created has a fairly small 
> set of dependencies: intltool-native, dbus, libcap. Given this, I'd 
> like to propose transitioning away from populate-volatiles to 
> systemd-tmpfiles, even for non-systemd images. I think that the 
> update-tmpfiles shell script may be of use in a transition, but before 
> we even begin discussing a transition path, I'd like to request 
> comments on the notion of moving to it at all. Thoughts? Objections?
>
> Thanks,
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------090105030706030308000407
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hi Chris,<br>
      <br>
      I'm now working on some bugs related to read-only rootfs. <br>
      <br>
      You can get more information from the bug link below. The related
      bugs are listed in the blocks list of this bug.<br>
      <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103">https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103</a><br>
      You can also review the patchset for these bugs on <br>
      <pre wrap=""><a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images</a></pre>
      <br>
      I'm really interested on this topic. From my understanding, this
      RFC mainly focuses on read-only rootfs support for systemd based
      images, right?<br>
      I've read though this thread carefully, but still can't get a
      clear picture about this RFC.<br>
      Could you please give me a link to your patchset, if convenient?<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 07/25/2013 02:54 AM, Chris Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr">
        <div style="">Greetings all,</div>
        <div style=""><br>
        </div>
        <div style="">I've recently been doing some work at Mentor
          Graphics on read-only-rootfs, for our purposes, and have done
          some things which I think may be of use. I'm looking for
          comments/thoughts on the approach and potential use of a
          pattern generally, and also wish to discuss the volatiles vs
          tmp files.d situation.</div>
        <div style=""><br>
        </div>
        <div style="">I have recently created a `meta-ro-rootfs` layer
          to hold work in this direction which is not yet in or-core. As
          is fairly usual, it's a staging area between us and upstream,
          not a place for anything to live permanently. What follows is
          a summation of the work done there thus far:</div>
        <div style=""><br>
        </div>
        <div style="">- Created a 'systemd-tmpfiles' recipe for
          non-systemd builds, and also for native<br>
        </div>
        <div style=""><br>
        </div>
        <div style="">&nbsp; - Patched in --sysroot= support for
          systemd-tmpfiles, to facilitate running it up front against
          the filesystem at do_rootfs time the way read_only_rootfs_hook
          does with populate-volatiles</div>
        <div style=""><br>
        </div>
        <div style="">&nbsp; - Added an 'update-tmpfiles' script, which
          iterates over all files in /etc/default/volatiles/, converting
          them to tmpfiles.d config files, writing them into
          /usr/lib/tmpfiles.d/, and removing the volatile config files</div>
        <div style=""><br>
        </div>
        <div style="">&nbsp; - Reduced the dependencies, via patches and
          EXTRA_OECONF, as much as seemed to be viable</div>
        <div style=""><br>
        </div>
        <div style="">
          <div>- Split out 'systemd-tmpfiles' from 'systemd' package in
            the main systemd recipe, equivalent to the standalone one,
            for builds with `systemd` in DISTRO_FEATURES</div>
          <div><br>
          </div>
          <div style="">- Created a 'read-only-rootfs-systemd' bbclass,
            which appends the bits to run both update-tmpfiles and
            systemd-tmpfiles against the filesystem at do_rootfs time
            for systemd distros. This will need to be altered to not
            remove the volatiles config files for non-systemd *images*.
            I realize there are many use cases to consider in the
            sysvinit vs systemd realm, and I haven't verified that all
            are satisfied just yet, as systemd is our current priority
            for r/o rootfs.</div>
          <div style=""><br>
          </div>
          <div style="">- Added a COMPLEMENTARY_GLOBS config (in the
            layer.conf for now, though I may move it into the bbclass)
            which adds `pkg-volatile` for each `pkg` to the rootfs if
            read-only-rootfs is enabled.</div>
          <div style=""><br>
          </div>
          <div style="">- Implemented a prototype configuration for dbus
            which uses this to support read-only-rootfs. In the main
            package, we install a dbus.conf into /usr/lib/tmpfiles.d/
            which ensures /var/lib/dbus exists for the non-r/o case,
            without including the path in the package (as including
            paths within volatile paths in a binary package will break
            things). In the dbus-volatile package, I install a different
            dbus.conf to /etc/tmpfiles.d/, which overrides the one in
            /usr/lib/tmpfiles.d/ (yes, update-alternatives would have
            been an option too, and has a certain amount of merit, as
            /etc/tmpfiles.d/ is supposed to be reserved for use by the
            administrator), and this config ensures that
            /var/volatile/lib/dbus is created and that /var/lib/dbus is
            a symlink which points to it.</div>
          <div style=""><br>
          </div>
          <div style="">I have confirmed that I can create a systemd
            image with read-only-rootfs and read-only-rootfs-systemd
            inherited, and dbus is able to write to the volatile
            /var/lib/dbus/ path.</div>
          <div style="">
            <br>
          </div>
          <div style="">I think this is a step in the right direction,
            though clearly more needs to be worked out, but this pattern
            of using override volatile/tmpfiles configurations with an
            additional complementary package should let us cleanly share
            binary packages between r/o and non-r/o images.</div>
          <div style=""><br>
          </div>
          <div style="">Now, regarding tmpfiles.d vs volatiles. This is
            a rather unpleasant situation currently, as for a recipe to
            cleanly support both sysvinit and systemd images, it needs
            not only both sysv init script and systemd services (though
            admittedly the latter is optional with sysv compat), it also
            needs to provide both a volatiles config and a tmpfiles.d
            config if it needs volatile paths.</div>
          <div style=""><br>
          </div>
          <div style="">The standalone systemd-tmpfiles recipe I've
            created has a fairly small set of dependencies:
            intltool-native, dbus, libcap. Given this, I'd like to
            propose transitioning away from populate-volatiles to
            systemd-tmpfiles, even for non-systemd images. I think that
            the update-tmpfiles shell script may be of use in a
            transition, but before we even begin discussing a transition
            path, I'd like to request comments on the notion of moving
            to it at all. Thoughts? Objections?</div>
          <div style=""><br>
          </div>
          <div style="">Thanks,</div>
        </div>
        -- <br>
        Christopher Larson<br>
        clarson at kergoth dot com<br>
        Founder - BitBake, OpenEmbedded, OpenZaurus<br>
        Maintainer - Tslib<br>
        Senior Software Engineer, Mentor Graphics
      </div>
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

--------------090105030706030308000407--
