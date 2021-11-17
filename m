X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Peter Bergin" <peter@berginkonsult.se>
Subject: rust - relocation error when setting up SDK
Message-ID: <638223f0-4d36-559d-fd7d-21a064a53e3e@berginkonsult.se>
Date: Wed, 17 Nov 2021 11:27:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

Hi,

I'm trying to explore how to add and use rust in the SDK for 
cross-compilation. When installing and setting up a SDK with 
packagegroup-rust-cross-canadian it fails if the installation path is 
too long. I have found similar issues in meta-rust [1] and some other 
setup [2] but can not directly find a solution to the problem by myself. 
I'm open for help and ideas how to solve this.

Steps to reproduce:

   <setup standard poky build, qemux86_64>
   $ echo 'TOOLCHAIN_HOST_TASK:append = " 
packagegroup-rust-cross-canadian-${MACHINE}"' >> conf/auto.conf
   $ bitbake core-image-minimal -cpopulate_sdk

   <installation>
   $ 
./tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-3.4+snapshot.sh 

   Poky (Yocto Project Reference Distro) SDK installer version 3.4+snapshot
========================================================================
   Enter target directory for SDK (default: /opt/poky/3.4+snapshot): 
/work/sdk/install/sdk/to/a/really/long/path
   You are about to install the SDK to 
"/work/sdk/install/sdk/to/a/really/long/path". Proceed [Y/n]? y
   Extracting 
SDK....................................................................................done 

   Setting it up...ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/cargo-clippy, 
interp size = 84 and 99 is needed.
   ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/cargo, 
interp size = 84 and 99 is needed.
   ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustfmt, 
interp size = 84 and 99 is needed.
   ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustdoc, 
interp size = 84 and 99 is needed.
   ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustc, 
interp size = 84 and 99 is needed.
   ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/clippy-driver, 
interp size = 84 and 99 is needed.
   ERROR: could not relocate 
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/lib/x86_64-poky-linux/rustlib/x86_64-unknown-linux-gnu/bin/rust-llvm-dwp, 
interp size = 84 and 99 is needed.
   done
   SDK has been successfully set up and is ready to be used.
   Each time you wish to use the SDK in a new shell session, you need to 
source the environment setup script e.g.
    $ . 
/work/sdk/install/sdk/to/a/really/long/path/environment-setup-core2-64-poky-linux 



The workaround is fairly easy and it is to install the SDK to a shorter 
path. In that sense this is no big blocker but if we can find an easy 
solution it would be good.

Best Regards,
/Peter

[1] https://github.com/kraj/meta-clang/issues/119

[2] https://lists.yoctoproject.org/g/yocto/message/48173

