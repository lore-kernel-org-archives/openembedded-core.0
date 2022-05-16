Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ac2d4184-10ce-01b2-2fd7-454cf8080452@gmail.com>
Date: Mon, 16 May 2022 07:30:05 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] About the sstate cache directory hierarchy
References: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Richard Purdie <richard.purdie@linuxfoundation.org>

On 1/28/22 08:06, Chen Qi wrote:
> Hi All,
> 
> I'm sending out this email because I'm wondering if we can change the 
> sstate cache directory to use ${PN} and taskname as subditories. Hope to 
> hear your opinions.
> 
> Below is the long story.
> 
> Recently I noticed that running `bitbake xxx -c cleansstate' usually 
> takes more than 10 minutes.
> 
> After some investigation, I can see that most of the time is spent on 
> file searching. This is because we have:
> 
> SSTATE_PATHSPEC   = 
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*" 
> 
> 
> And our sstate cache directory's hierarchy uses hash[:2]/hash[2:4]/ as 
> sub-directories.
> 
> This essentially means that all sub-directories are searched. This would 
> take a long time, especially when run for the first time. I made some 
> changes to  output the time and the logs are as below.
> 
> $ bitbake glibc -c cleansstate
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.34:r0::7:*_populate_lic.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst* 
> 
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043 seconds
> 
> I figured that unlike git, we do have knowledge on our sstate objects. 
> It does not seem necessary to use hash value as sub directory. So I 
> changed the sstate directory hierarchy to use ${PN}/taskname/ as sub 
> directories, and here's the result.
> 
> $ bitbake libgcc -c cleansstate
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_date_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.020630598068237305 seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0011608600616455078 
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007557868957519531 
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_rpm/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_write_rpm.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0013995170593261719 
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007488727569580078 
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/sstate:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0005896091461181641 
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing 
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysroot/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysroot.tar.zst* 
> 
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125 seconds
> 
> It's much faster.
> 
> In addition, the sub dirs now give more info, which should potentially 
> make sstate cache easier to manage.
> 
> Attached is the patch to quickly try things out. Hope to hear your 
> opinions.
> 
> Best Regards,
> 
> Chen Qi
> 

I thought this sounded interesting. Has anything come out of this that I 
missed ?

Jacob
