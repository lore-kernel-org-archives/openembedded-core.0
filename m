Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web09.46074.1622476754954581463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 08:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKOQMRTS;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id s107so13396702ybi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8nPtKbMmYFPYoVXcIA4uybZhe6yQJX8Q8EoZo9lkNCk=;
        b=hKOQMRTSpimpH3+2gZZOUeDDhGmPaAkwiebVtmFAScppC/PPfg16Lwz3OiYYGtTBcK
         OQaoQtvUNOLYnHXfbQFpK8U24padUw7rmFZYvSB3I8hCRw4Ggra801gMuU3c1XLK296S
         d0gUaTlbIQomFieiU10kpTLcL/Gcj/MBZDNVO4JZz5rngxDKerItb3bgYIsV6cKvuCQ7
         aT1ss3yggPf20+n5T2Q+Rs+589w/1fzFyA43yct+/LSJlYzK7ExO0qRinojMJLT0Sn36
         UMO9rrpqdinGydi1cLJ78tDdfGN5n4NA+3HpemXJ2yZBpATxFpdgV02oAAtHBsww8IrR
         PvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nPtKbMmYFPYoVXcIA4uybZhe6yQJX8Q8EoZo9lkNCk=;
        b=r1bvTgFUFU4LdvoRDX7oYQTZW2/YiHDZ2O0/i37NVa7L0wJBay/fXHcsSz5kQve6Nk
         Ak8JgOsv4qR08vY6crifAihIXCYsww07GIeHbRN+Qo92uv9LL/UjmfMy3Kr5ajQ/D+VY
         ISxO3KZHNDQCUakn3a/Jz73Tr+Rz/V5ARsleJO2SSqm79dUV1Y9u0btCLU0jsfiw2iOR
         tpbtXGVKNcNv3ELHesmhy/HHM3DLWzY2bG8oBV4Ql8g/QYY5tOyJaC6zPiozQtnRViKO
         hDAOa6kPFL92Sp5ZNpORej2slyZSXpDn/Nrg3fk77O2+lFcqXflG040R7LANP/x7+6WQ
         FcWg==
X-Gm-Message-State: AOAM532GIM36CKkyrlMF2QOBEl8FO4hgYA1LDFh4kBdksBX9faNxI+32
	HIOYk3pdsyFYyFX2HM1ud6Kw9NtEv27uefRad3M=
X-Google-Smtp-Source: ABdhPJxZdw1nEDXNIu7d8s0+/6Hk5aEBedFP57uVEDk9Gxoivkpetvzw0sMAAonLo/HD/+I7u1puPEIqssKt8vPgQgU=
X-Received: by 2002:a05:6902:110e:: with SMTP id o14mr32743633ybu.284.1622476753989;
 Mon, 31 May 2021 08:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
 <20210222183818.22615-1-klaus@linux.vnet.ibm.com> <648ca8e0-5a3d-ff2a-2b5a-5884cd618f5c@kontron.de>
In-Reply-To: <648ca8e0-5a3d-ff2a-2b5a-5884cd618f5c@kontron.de>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 31 May 2021 05:59:03 -1000
Message-ID: <CAGDS+n=rFYdcRMvTqqnA+PKPLf0FhfwSopkzpD0yNKxLa6hcNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: Don't use unit addresses on FIT
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: klaus@linux.vnet.ibm.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 31, 2021 at 4:59 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Steve,
>
> On 22.02.21 19:38, Klaus Heinrich Kiwi via lists.openembedded.org wrote:
> > Das U-Boot 2021.4-rc1 has the following commit:
> >
> >     commit 3f04db891a353f4b127ed57279279f851c6b4917
> >     Author: Simon Glass <sjg@chromium.org>
> >     Date:   Mon Feb 15 17:08:12 2021 -0700
> >
> >         image: Check for unit addresses in FITs
> >
> >         Using unit addresses in a FIT is a security risk. Add a check for
> >         this and disallow it.
> >
> >         CVE-2021-27138
> >
> > Adjust the kernel-fitimage.bbclass accordingly to not use unit
> > addresses. This changte is required before we can bump U-Boot to 2021.4.
> >
> > Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>
> Could you pick this and the follow-up patch 0ef3a5e2a6d4 ("kernel-fitimage.bbclass: drop unit addresses from bootscr sections") to the dunfell branch to fix FIT images on U-Boot 2021.01 or later with dunfell?

I can't do a clean cherry-pick of this patch.  If you'd like to submit
dunfell versions of these two patches I will add them to my testing
queue.

Steve

>
> Thanks
> Frieder
>
> > ---
> >
> > Notes:
> >     V2 Notes:
> >       - Adjusted testcases
> >         (reported by Richard Purdie <richard.purdie@linuxfoundation.org>)
> >
> >  meta/classes/kernel-fitimage.bbclass     | 40 ++++++++++++------------
> >  meta/lib/oeqa/selftest/cases/fitimage.py | 36 ++++++++++-----------
> >  2 files changed, 38 insertions(+), 38 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> > index 2414870817..f5082c93df 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -161,7 +161,7 @@ fitimage_emit_section_kernel() {
> >       fi
> >
> >       cat << EOF >> ${1}
> > -                kernel@${2} {
> > +                kernel-${2} {
> >                          description = "Linux kernel";
> >                          data = /incbin/("${3}");
> >                          type = "kernel";
> > @@ -170,7 +170,7 @@ fitimage_emit_section_kernel() {
> >                          compression = "${4}";
> >                          load = <${UBOOT_LOADADDRESS}>;
> >                          entry = <${ENTRYPOINT}>;
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo = "${kernel_csum}";
> >                          };
> >                  };
> > @@ -179,7 +179,7 @@ EOF
> >       if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
> >               sed -i '$ d' ${1}
> >               cat << EOF >> ${1}
> > -                        signature@1 {
> > +                        signature-1 {
> >                                  algo = "${kernel_csum},${kernel_sign_algo}";
> >                                  key-name-hint = "${kernel_sign_keyname}";
> >                          };
> > @@ -210,14 +210,14 @@ fitimage_emit_section_dtb() {
> >               dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
> >       fi
> >       cat << EOF >> ${1}
> > -                fdt@${2} {
> > +                fdt-${2} {
> >                          description = "Flattened Device Tree blob";
> >                          data = /incbin/("${3}");
> >                          type = "flat_dt";
> >                          arch = "${UBOOT_ARCH}";
> >                          compression = "none";
> >                          ${dtb_loadline}
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo = "${dtb_csum}";
> >                          };
> >                  };
> > @@ -226,7 +226,7 @@ EOF
> >       if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
> >               sed -i '$ d' ${1}
> >               cat << EOF >> ${1}
> > -                        signature@1 {
> > +                        signature-1 {
> >                                  algo = "${dtb_csum},${dtb_sign_algo}";
> >                                  key-name-hint = "${dtb_sign_keyname}";
> >                          };
> > @@ -283,7 +283,7 @@ fitimage_emit_section_setup() {
> >       setup_csum="${FIT_HASH_ALG}"
> >
> >       cat << EOF >> ${1}
> > -                setup@${2} {
> > +                setup-${2} {
> >                          description = "Linux setup.bin";
> >                          data = /incbin/("${3}");
> >                          type = "x86_setup";
> > @@ -292,7 +292,7 @@ fitimage_emit_section_setup() {
> >                          compression = "none";
> >                          load = <0x00090000>;
> >                          entry = <0x00090000>;
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo = "${setup_csum}";
> >                          };
> >                  };
> > @@ -321,7 +321,7 @@ fitimage_emit_section_ramdisk() {
> >       fi
> >
> >       cat << EOF >> ${1}
> > -                ramdisk@${2} {
> > +                ramdisk-${2} {
> >                          description = "${INITRAMFS_IMAGE}";
> >                          data = /incbin/("${3}");
> >                          type = "ramdisk";
> > @@ -330,7 +330,7 @@ fitimage_emit_section_ramdisk() {
> >                          compression = "none";
> >                          ${ramdisk_loadline}
> >                          ${ramdisk_entryline}
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo = "${ramdisk_csum}";
> >                          };
> >                  };
> > @@ -339,7 +339,7 @@ EOF
> >       if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
> >               sed -i '$ d' ${1}
> >               cat << EOF >> ${1}
> > -                        signature@1 {
> > +                        signature-1 {
> >                                  algo = "${ramdisk_csum},${ramdisk_sign_algo}";
> >                                  key-name-hint = "${ramdisk_sign_keyname}";
> >                          };
> > @@ -377,7 +377,7 @@ fitimage_emit_section_config() {
> >       # Test if we have any DTBs at all
> >       sep=""
> >       conf_desc=""
> > -     conf_node="conf@"
> > +     conf_node="conf-"
> >       kernel_line=""
> >       fdt_line=""
> >       ramdisk_line=""
> > @@ -396,19 +396,19 @@ fitimage_emit_section_config() {
> >       if [ -n "${kernel_id}" ]; then
> >               conf_desc="Linux kernel"
> >               sep=", "
> > -             kernel_line="kernel = \"kernel@${kernel_id}\";"
> > +             kernel_line="kernel = \"kernel-${kernel_id}\";"
> >       fi
> >
> >       if [ -n "${dtb_image}" ]; then
> >               conf_desc="${conf_desc}${sep}FDT blob"
> >               sep=", "
> > -             fdt_line="fdt = \"fdt@${dtb_image}\";"
> > +             fdt_line="fdt = \"fdt-${dtb_image}\";"
> >       fi
> >
> >       if [ -n "${ramdisk_id}" ]; then
> >               conf_desc="${conf_desc}${sep}ramdisk"
> >               sep=", "
> > -             ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
> > +             ramdisk_line="ramdisk = \"ramdisk-${ramdisk_id}\";"
> >       fi
> >
> >       if [ -n "${bootscr_id}" ]; then
> > @@ -419,16 +419,16 @@ fitimage_emit_section_config() {
> >
> >       if [ -n "${config_id}" ]; then
> >               conf_desc="${conf_desc}${sep}setup"
> > -             setup_line="setup = \"setup@${config_id}\";"
> > +             setup_line="setup = \"setup-${config_id}\";"
> >       fi
> >
> >       if [ "${default_flag}" = "1" ]; then
> >               # default node is selected based on dtb ID if it is present,
> >               # otherwise its selected based on kernel ID
> >               if [ -n "${dtb_image}" ]; then
> > -                     default_line="default = \"conf@${dtb_image}\";"
> > +                     default_line="default = \"conf-${dtb_image}\";"
> >               else
> > -                     default_line="default = \"conf@${kernel_id}\";"
> > +                     default_line="default = \"conf-${kernel_id}\";"
> >               fi
> >       fi
> >
> > @@ -441,7 +441,7 @@ fitimage_emit_section_config() {
> >                       ${ramdisk_line}
> >                       ${bootscr_line}
> >                       ${setup_line}
> > -                        hash@1 {
> > +                        hash-1 {
> >                                  algo = "${conf_csum}";
> >                          };
> >  EOF
> > @@ -478,7 +478,7 @@ EOF
> >               sign_line="${sign_line};"
> >
> >               cat << EOF >> ${its_file}
> > -                        signature@1 {
> > +                        signature-1 {
> >                                  algo = "${conf_csum},${conf_sign_algo}";
> >                                  key-name-hint = "${conf_sign_keyname}";
> >                               ${sign_line}
> > diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> > index 0958036a6f..02692de822 100644
> > --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> > +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> > @@ -69,9 +69,9 @@ FIT_DESC = "A model description"
> >              'type = "ramdisk";',
> >              'load = <0x88000000>;',
> >              'entry = <0x88000000>;',
> > -            'default = "conf@1";',
> > -            'kernel = "kernel@1";',
> > -            'ramdisk = "ramdisk@1";'
> > +            'default = "conf-1";',
> > +            'kernel = "kernel-1";',
> > +            'ramdisk = "ramdisk-1";'
> >              ]
> >
> >          with open(fitimage_its_path) as its_file:
> > @@ -137,12 +137,12 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
> >              "%s FIT image doesn't exist" % (fitimage_path))
> >
> >          req_itspaths = [
> > -            ['/', 'images', 'kernel@1'],
> > -            ['/', 'images', 'kernel@1', 'signature@1'],
> > -            ['/', 'images', 'fdt@am335x-boneblack.dtb'],
> > -            ['/', 'images', 'fdt@am335x-boneblack.dtb', 'signature@1'],
> > -            ['/', 'configurations', 'conf@am335x-boneblack.dtb'],
> > -            ['/', 'configurations', 'conf@am335x-boneblack.dtb', 'signature@1'],
> > +            ['/', 'images', 'kernel-1'],
> > +            ['/', 'images', 'kernel-1', 'signature-1'],
> > +            ['/', 'images', 'fdt-am335x-boneblack.dtb'],
> > +            ['/', 'images', 'fdt-am335x-boneblack.dtb', 'signature-1'],
> > +            ['/', 'configurations', 'conf-am335x-boneblack.dtb'],
> > +            ['/', 'configurations', 'conf-am335x-boneblack.dtb', 'signature-1'],
> >          ]
> >
> >          itspath = []
> > @@ -158,7 +158,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
> >                  elif line.endswith('{'):
> >                      itspath.append(line[:-1].strip())
> >                      itspaths.append(itspath[:])
> > -                elif itspath and itspath[-1] == 'signature@1':
> > +                elif itspath and itspath[-1] == 'signature-1':
> >                      itsdotpath = '.'.join(itspath)
> >                      if not itsdotpath in sigs:
> >                          sigs[itsdotpath] = {}
> > @@ -182,7 +182,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
> >          }
> >
> >          for itspath, values in sigs.items():
> > -            if 'conf@' in itspath:
> > +            if 'conf-' in itspath:
> >                  reqsigvalues = reqsigvalues_config
> >              else:
> >                  reqsigvalues = reqsigvalues_image
> > @@ -210,9 +210,9 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
> >                      signed_sections[in_signed] = {}
> >                  key, value = line.split(':', 1)
> >                  signed_sections[in_signed][key.strip()] = value.strip()
> > -        self.assertIn('kernel@1', signed_sections)
> > -        self.assertIn('fdt@am335x-boneblack.dtb', signed_sections)
> > -        self.assertIn('conf@am335x-boneblack.dtb', signed_sections)
> > +        self.assertIn('kernel-1', signed_sections)
> > +        self.assertIn('fdt-am335x-boneblack.dtb', signed_sections)
> > +        self.assertIn('conf-am335x-boneblack.dtb', signed_sections)
> >          for signed_section, values in signed_sections.items():
> >              value = values.get('Sign algo', None)
> >              self.assertEqual(value, 'sha256,rsa2048:oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
> > @@ -298,7 +298,7 @@ FIT_HASH_ALG = "sha256"
> >          its_lines = [line.strip() for line in its_file.readlines()]
> >
> >          exp_node_lines = [
> > -            'kernel@1 {',
> > +            'kernel-1 {',
> >              'description = "Linux kernel";',
> >              'data = /incbin/("' + initramfs_bundle + '");',
> >              'type = "kernel";',
> > @@ -307,7 +307,7 @@ FIT_HASH_ALG = "sha256"
> >              'compression = "none";',
> >              'load = <' + kernel_load + '>;',
> >              'entry = <' + kernel_entry + '>;',
> > -            'hash@1 {',
> > +            'hash-1 {',
> >              'algo = "' + fit_hash_alg +'";',
> >              '};',
> >              '};'
> > @@ -327,7 +327,7 @@ FIT_HASH_ALG = "sha256"
> >              else:
> >                  self.assertTrue(test_passed == True,"kernel node does not match expectation")
> >
> > -        rx_configs = re.compile("^conf@.*")
> > +        rx_configs = re.compile("^conf-.*")
> >          its_configs = list(filter(rx_configs.match, its_lines))
> >
> >          for cfg_str in its_configs:
> > @@ -348,7 +348,7 @@ FIT_HASH_ALG = "sha256"
> >              else:
> >                  print("kernel keyword found in the description line")
> >
> > -            if 'kernel = "kernel@1";' not in node:
> > +            if 'kernel = "kernel-1";' not in node:
> >                  self.assertTrue(test_passed == True,"kernel line not found")
> >                  break
> >              else:
> >
> >
> >
> >
> >
>
> 
>
