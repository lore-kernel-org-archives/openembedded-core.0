Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCCCB6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 07:07:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6V77ICl012528
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2013 00:07:18 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 31 Jul 2013 00:07:18 -0700
Message-ID: <51F8B7AE.5050307@windriver.com>
Date: Wed, 31 Jul 2013 15:07:26 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<51F092C5.3060906@windriver.com>
	<CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
In-Reply-To: <CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 31 Jul 2013 07:07:22 -0000
Content-Type: multipart/alternative;
	boundary="------------010308010700080200000508"

--------------010308010700080200000508
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 02:17 AM, Chris Larson wrote:
> On Wed, Jul 24, 2013 at 7:51 PM, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     You can get more information from the bug link below. The related
>     bugs are listed in the blocks list of this bug.
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103
>     You can also review the patchset for these bugs on
>
>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images
>
>
>     I'm really interested on this topic. From my understanding, this
>     RFC mainly focuses on read-only rootfs support for systemd based
>     images, right?
>
>
> It does, but only because of the reliance upon tmpfiles.d's ability to 
> override config files (the foo-volatile .conf will override the 
> non-r/o foo package tmpfiles.d config). An alternative approach would 
> be to use update-alternatives to manage the volatile configuration, 
> and then it could use either tmpfiles.d or volatiles, but the approach 
> (Providing a r/o volatile config in a foo-volatile package, and using 
> COMPLEMENTARY_GLOBS to get them installed for read-only-rootfs) should 
> work, I think, regardless.
>
>     I've read though this thread carefully, but still can't get a
>     clear picture about this RFC.
>     Could you please give me a link to your patchset, if convenient?
>
>
> To summarize the RFC:
>
> - I think the best approach to use the same set of packages for both 
> non-r/o and for r/o is to use a complementary package which overrides 
> the main package configuration to set up the additional links 
> necessary to move bits into volatile paths. I think that implementing 
> it in this way has value as opposed to the implementation in 
> "initscripts: use a uniform way to handle directories in read-only 
> rootfs", as it uses the same mechanism for read-only as is used for 
> non-read-only, the only difference is the configuration used and the 
> fact that it gets run at do_rootfs time rather than at boot, and it 
> means no read-only bits are in the filesystem unless read-only-rootfs 
> is in IMAGE_FEATURES.
> - To support systemd images with read-only-rootfs, we need to be able 
> to populate tmpfiles.d based on its config files at do_rootfs time the 
> way we do with populate-volatiles, or we need to duplicate all 
> tmpfiles.d configs to volatile configs. I chose the former, by 
> enabling a standalone build of systemd-tmpfiles-native and adding it 
> to the read_only_rootfs_hook.
> - https://github.com/MentorEmbedded/meta-ro-rootfs has our work so far 
> on the above.
> - Proposing the need to consolidate tmpfiles.d and volatiles.
>
Hi Chirst,

I've read the patches. But I haven't tried them out yet because 
currently I can't afford the time ....
 From my understanding, the core concept is to use COMPLEMENTARY_GLOBS 
for *-volatile packages, and these  -volatile packages basically contain 
config files whose major purpose is to create appropriate links at 
rootfs time,  and these packages will be installed only if 
'read-only-rootfs' is in IMAGE_FEATURES. Right?

> - Next steps, from my perspective:
>
>     - We need to agree on a pattern to follow for the read only rootfs 
> support for individual pieces of recipes, as we need to work through 
> them individually. Currently we have two possibilities on the floor, 
> the /etc/default/readonly/ approach advocated by Chen Qi,

When I first came up with approach, I expected that there should be a 
bunch of packages that might need this. But it turned out that in 
OE-core, only the initscripts package needed this. So let's call it a 
fall-back approach. If some package *really* needs this, then we write a 
config file under /etc/default/readonly. By really, I mean, maybe some 
packages could simply be patched to work in a read-only rootfs. And note 
that I added a function in read-only-rootfs-hook.sh which is used to 
check whether a specific directory is on a read-only partition. This is 
because it's possible that users may use customized fstab which, for 
example, mounts a writable media over /var. We should take this 
situation into consideration.

That's also partly the reason that I dropped my 'lighttpd: xxx' patch. 
Moving its log location to some volatile storage to omit errors at 
system boot-up doesn't make the situation any better, because the /www 
directory is still not writable. So I would assume that if a user if 
using a read-only rootfs and he's using his system to hold a web, he 
should at least have some writable storage to store the data.


> and the overriding the volatiles/tmpfiles.d config file approach 
> advocated by myself.
>     - We need a plan of attack to avoid the need to duplicate 
> tmpfiles.d and volatiles configuration. I was leaning toward using 
> systemd-tmpfiles for both sysvinit and systemd,

I have very limited knowledge on systemd and sysvinit, but still I'm not 
sure about this change.
In my opinion, maybe we should make sysv and systemd have as little 
effect on each other as possible.
I'm afraid that this change will bring some potential problems that are 
not spotted at first.

Best Regards,
Chen Qi

> but others have advocated moving to tmpfiles.d configuration but using 
> a homerolled script to implement it. Either would be a step in the 
> right direction: moving away from volatiles config files in favor of 
> tmpfiles.d config files.
>     - We need a coherent, consistent mechanism for the user to choose 
> whether a given file or files will be pregenerated at build time (e.g. 
> ssh host keys, machine id) or generated every time at boot, for 
> applicable cases.
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------010308010700080200000508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/31/2013 02:17 AM, Chris Larson
      wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On Wed, Jul 24, 2013 at 7:51 PM,
            ChenQi <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div>You can get more information from the bug link below.
                The related bugs are listed in the blocks list of this
                bug.<br>
                <a moz-do-not-send="true"
                  href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103"
                  target="_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103</a><br>
                You can also review the patchset for these bugs on <br>
                <pre><a moz-do-not-send="true" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images" target="_blank">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images</a></pre>
                <br>
                I'm really interested on this topic. From my
                understanding, this RFC mainly focuses on read-only
                rootfs support for systemd based images, right?<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div style="">It does, but only because of the reliance upon
              tmpfiles.d's ability to override config files (the
              foo-volatile .conf will override the non-r/o foo package
              tmpfiles.d config). An alternative approach would be to
              use update-alternatives to manage the volatile
              configuration, and then it could use either tmpfiles.d or
              volatiles, but the approach (Providing a r/o volatile
              config in a foo-volatile package, and using
              COMPLEMENTARY_GLOBS to get them installed for
              read-only-rootfs) should work, I think, regardless.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div> I've read though this thread carefully, but still
                can't get a clear picture about this RFC.<br>
                Could you please give me a link to your patchset, if
                convenient?</div>
            </blockquote>
          </div>
          <br>
          To summarize the RFC:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">- I think the best approach to use the
          same set of packages for both non-r/o and for r/o is to use a
          complementary package which overrides the main package
          configuration to set up the additional links necessary to move
          bits into volatile paths. I think that implementing it in this
          way has value as opposed to the implementation in
          "initscripts: use a uniform way to handle directories in
          read-only rootfs", as it uses the same mechanism for read-only
          as is used for non-read-only, the only difference is the
          configuration used and the fact that it gets run at do_rootfs
          time rather than at boot, and it means no read-only bits are
          in the filesystem unless read-only-rootfs is in
          IMAGE_FEATURES.<br>
        </div>
        <div class="gmail_extra" style="">- To support systemd images
          with read-only-rootfs, we need to be able to populate
          tmpfiles.d based on its config files at do_rootfs time the way
          we do with populate-volatiles, or we need to duplicate all
          tmpfiles.d configs to volatile configs. I chose the former, by
          enabling a standalone build of systemd-tmpfiles-native and
          adding it to the read_only_rootfs_hook.</div>
        <div class="gmail_extra" style="">- <a moz-do-not-send="true"
            href="https://github.com/MentorEmbedded/meta-ro-rootfs">https://github.com/MentorEmbedded/meta-ro-rootfs</a> has
          our work so far on the above.</div>
        <div class="gmail_extra" style="">- Proposing the need to
          consolidate tmpfiles.d and volatiles.</div>
        <div class="gmail_extra" style=""><br>
        </div>
      </div>
    </blockquote>
    Hi Chirst,<br>
    <br>
    I've read the patches. But I haven't tried them out yet because
    currently I can't afford the time ....<br>
    From my understanding, the core concept is to use
    COMPLEMENTARY_GLOBS for *-volatile packages, and these  -volatile
    packages basically contain config files whose major purpose is to
    create appropriate links at rootfs time,  and these packages will be
    installed only if 'read-only-rootfs' is in IMAGE_FEATURES. Right?<br>
    <br>
    <blockquote
cite="mid:CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra" style="">- Next steps, from my
          perspective:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra" style="">    - We need to agree on a
          pattern to follow for the read only rootfs support for
          individual pieces of recipes, as we need to work through them
          individually. Currently we have two possibilities on the
          floor, the /etc/default/readonly/ approach advocated by Chen
          Qi,</div>
      </div>
    </blockquote>
    <br>
    When I first came up with approach, I expected that there should be
    a bunch of packages that might need this. But it turned out that in
    OE-core, only the initscripts package needed this. So let's call it
    a fall-back approach. If some package *really* needs this, then we
    write a config file under /etc/default/readonly. By really, I mean,
    maybe some packages could simply be patched to work in a read-only
    rootfs. And note that I added a function in read-only-rootfs-hook.sh
    which is used to check whether a specific directory is on a
    read-only partition. This is because it's possible that users may
    use customized fstab which, for example, mounts a writable media
    over /var. We should take this situation into consideration.<br>
    <br>
    That's also partly the reason that I dropped my 'lighttpd: xxx'
    patch. Moving its log location to some volatile storage to omit
    errors at system boot-up doesn't make the situation any better,
    because the /www directory is still not writable. So I would assume
    that if a user if using a read-only rootfs and he's using his system
    to hold a web, he should at least have some writable storage to
    store the data.<br>
    <br>
    <br>
    <blockquote
cite="mid:CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra" style=""> and the overriding the
          volatiles/tmpfiles.d config file approach advocated by myself.</div>
        <div class="gmail_extra" style="">    - We need a plan of attack
          to avoid the need to duplicate tmpfiles.d and volatiles
          configuration. I was leaning toward using systemd-tmpfiles for
          both sysvinit and systemd,</div>
      </div>
    </blockquote>
    <br>
    I have very limited knowledge on systemd and sysvinit, but still I'm
    not sure about this change. <br>
    In my opinion, maybe we should make sysv and systemd have as little
    effect on each other as possible.<br>
    I'm afraid that this change will bring some potential problems that
    are not spotted at first.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra" style=""> but others have advocated
          moving to tmpfiles.d configuration but using a homerolled
          script to implement it. Either would be a step in the right
          direction: moving away from volatiles config files in favor of
          tmpfiles.d config files.</div>
        <div class="gmail_extra">    - We need a coherent, consistent
          mechanism for the user to choose whether a given file or files
          will be pregenerated at build time (e.g. ssh host keys,
          machine id) or generated every time at boot, for applicable
          cases.<br>
          -- <br>
          Christopher Larson<br>
          clarson at kergoth dot com<br>
          Founder - BitBake, OpenEmbedded, OpenZaurus<br>
          Maintainer - Tslib<br>
          Senior Software Engineer, Mentor Graphics  </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010308010700080200000508--
