Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwJw1-0003Lf-GG
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 23:24:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6VLDIGL024189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 14:13:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 31 Jul 2012 14:13:18 -0700
Message-ID: <50184A6D.2050208@windriver.com>
Date: Tue, 31 Jul 2012 16:13:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q6VLDIGL024189
Subject: RFC: OE-Core image creation and deployment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 21:24:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

Refactor of the OE-Core image creation
--------------------------------------

Preface:

The refactoring being discussed below attempts to cover the overall image=
=20
creation through image deployment process that I'd like to see in OE-Core=
.=20
Where existing functionality already exists, the refactoring work would c=
onsist=20
simply of adapting the items to the overall set of requirements and syste=
m=20
design.  I'm not proposing a "rewrite", but instead a process of cleanup,=
=20
refactoring of code, and writing new code when necessary.... Evolution vs=
=20
revolution!

A number of people have contributed to the set of requirements discussed =
below.=20
  One of the primary inputs has been the discussion started by Darren Har=
t=20
titled "RFC: Braindump on Bootloaders, Image Types, and Installers".

Comments, suggestions, offers of help are all appreciated!

Purpose:
--------

Refactoring the OE-Core image creation should include:

* A pluggable, configurable environment for creating, deploying and updat=
ing a=20
filesystem
   * Allow for a machine to specify the overall steps required to deploy =
a build=20
to a device
   * Allow for easy additions to the default OE-Core steps
   * Allow the steps to be started and stopped at any point.  (This is ne=
eded=20
for on-target installations)

* Existing workflows need to be maintained, new additional workflows (cro=
ss or=20
target based will be added)
   * Existing workflow of, bitbake <image>, should be maintained with lit=
tle to=20
no difference in behavior
   * New workflows of starting with package feeds should be created, that=
=20
perform, more or less, the same steps as the existing workflows

* Creation of a filesystem from a package feed
   * Either an internal (oe-core build) or external package feed (exporte=
d from=20
oe-core)
   * Ability to create a filesystem internally to the build system or ext=
ernally=20
(see Angstrom Narcissus)
   * Package Feeds: deb (apt-get), opkg, rpm (zypper or similar)
   * Output of the filesystem generation should be:
     * pseudo controlled directory
     * archive (tar/cpio) file

* Deployment of the filesystem
   * Input is the output of the filesystem generation
   * Support both pseudo based installs and "root" user installs
     * some deployment methods may not be available w/o root permissions
   * Ability to compress the filesystem image
     * lzma/gz/bz2/xz
   * Use the generated filesystem as input for a kernel+initramfs
     * This will likely require a custom kernel+image recipe/method
     * The output of this should be usable in other deployment images
     * Look at CONFIG_INITRAMFS_SOURCE option requirements
     * Look at mkelfimage for post build linking
   * support different deployment mechanisms
     * archive image deployment
       * tar/cpio/...
       * input to local NFS server
     * disk image deployment
       * Construct specific filesystem types:
          * ext2/ext3/ext4
          * other disk image types=85
       * Construct a partitioned disk image
         * LVM
         * RAID
         * Primary/secondary partitions
         * Support multiple partition map styles
           * MSDOS, MSDOS-PROTECTIVE
           * GUID Partition Table (GPT)
       * Include bootloader
         * setup of bootloader config files
         * (ia32) setup of MBR
       * Include kernel
         * kernel copied to /boot
         * kernel deployed via other methods (raw partition)
       * Include filesystem on one or more partitions
       * use fstab to specify partition layout and formats
         * Support READ-ONLY mounts
         * be able to specify geometry and other configuration elements
     * ISO/HYBRID image deployment
       * ISO based READ-ONLY filesystem (CD/DVD/USB stick)
       * unionfs and/or other live cd techniques
       * USB stick (or other media), partial-RO/RW
     * FLASH based image deployment
       * Construct specific filesystem types:
         * jffs2
         * cramfs
         * btrfs
         * squashfs
         * ubifs
      * Similar to disk images, construction multiple images for differen=
t flash=20
regions
        * Include bootloader, kernel, filesystem(s)
      * Ability to specify geometry and other flash specific requirements
   * Installer capable image
     * Installer(s) would be recipes that would be added to the image
     * Package feed and indexes would be copied to media(s)
   * Bootloader configuration
     * Select bootloader
     * Select configuration for a specific bootloader

* Update
   * Ability to use the package feeds to update an existing deployment
   * This should work both cross and on the target

How OE-Core works today:
------------------------

The basic strategy of OE-Core today is to provide a series of specialty r=
ecipes,=20
classes and configuration variables that together provide the necessary i=
tems to=20
construct a filesystem image.  The following will specify a few key terms=
 that=20
can be used to describe the existing process.

The 'distribution' configuration defines a basic set of configuration dat=
a that=20
a produced binary distribution will use to be consistent within itself.

A 'package' recipe provides the knowledge to build a single source packag=
e into=20
one or more binary packages.

A 'task' recipe is used to group together packages as well as other tasks=
 to=20
provide some type of functional grouping.  This grouping often includes t=
hings=20
such as everything required to boot a system.

An 'image' recipe specifies the tasks or packages required to construct a=
 given=20
image, from the available set of binary packages.

A 'package feed' is a set of binary packages that comprise the available =
set of=20
software that an image may install from.

When a developer uses OE-Core to build an image, they start by configurin=
g their=20
local.conf file and specifically the appropriate image options, and distr=
ibution=20
configuration.  They then proceed to build up their package feeds, either=
=20
manually by running specific builds, building 'world' or building a speci=
fic=20
image recipe.  To construct a filesystem, the image recipe is used.  This=
 uses=20
the image.bbclass file to construct a basic set of required packages that=
 need=20
to be on the image.  Using the classes to construct the rootfs for a give=
n=20
package type, this set of required packages is used to construct a soluti=
on=20
based on the (local) package feed.  The result is a directory that contai=
ns a=20
functional rootfs based on the parameters of the image recipe.  (Post ins=
tall=20
actions, such as prelinking may also occur at this time.)

The image class further uses a number of configuration resources to deter=
mine=20
the output format and will construct a basic image output.  This may be i=
n the=20
format of a raw ext2/ext3/ext4 image, tar-ball, jffs2 image, etc.

There is no direct deployment built into OE-Core.  So it is up to the use=
r to=20
determine how to deploy any bootloaders, kernel, or images onto the targe=
t=20
device.  (This is often done using end-user/machine specific scripting, o=
r via a=20
manual process.)

Each of the items above assume a single machine configuration for the tar=
get=20
configuration.

Vision of OE-Core image generation in the future:
-------------------------------------------------

Similar to today, the user will configure their local.conf file (distribu=
tion=20
configuration and associated items).  They will then proceed to build the=
ir=20
package feeds.  It's suggested that a new recipe type be created, the pur=
pose of=20
which is to enable someone to define the overall scope of the packages in=
 their=20
distribution, but not actually define what goes into a specific image=20
configuration.  For the sake of this document I will call them 'package-f=
eed'=20
recipes, but that name is up for discussion.  The 'world' is one such aut=
omatic=20
package-feed recipe, another may be a system similar to the existing imag=
e types=20
-- the goal is to make it easy for someone to define the set of available=
=20
packages without having to actually install these packages into an image.

Another way to look at the difference between a 'package-feed' recipe and=
 a task=20
recipe or an image recipe is the objective of each.  A task recipe's obje=
ctive=20
is to enable a group of functionality, but a single task recipe is often =
not=20
enough to define a full distribution.  An image recipe is used to select =
a=20
specific configuration of packages that are used to build a special purpo=
se=20
image.  A package-feed recipe would be used instead of specify the overal=
l scope=20
of binary packages available within a distribution.  This scope may inclu=
de=20
software that no image or task recipe ever references, but a package that=
 an end=20
user of the package feeds may add to their system.

The distribution create may stop at this stage or may continue through th=
e image=20
and deployment process.  The image and deployment process may also be run=
 at a=20
separate time based on the package-feed.

The image recipes, similar to today, would include the basic set of=20
functionality, via task recipes or package recipe dependencies on what mu=
st be=20
installed into a functional image.  In addition, custom image features ma=
y be=20
defined that enable read-only configurations, live-cd type configurations=
,=20
self-hosted installers, and other similar features.  For instance, instal=
l media=20
would automatically copy the package feeds to the media, as well as add v=
arious=20
installer packages and setup files.

In addition to the image recipes, deployment control would be specified. =
 This=20
would control the deployment mechanisms, partitioning, sizes, etc.  It co=
uld be=20
defined, using the overrides, on a machine specific basis or on a generic=
=20
build/project configuration level.  (Machine/BSP configuration files coul=
d also=20
tailor this deployment when specific machine configurations are known ahe=
ad of=20
time.)  The output of the deployment would be instructions, images and fi=
les=20
ready to be directly deployed onto a target.  For example, a specific mac=
hine's=20
depoloyment may simply be a set of disk images, including bootloader, ker=
nel,=20
initramfs, and various filesystems, along with instructions on how to ins=
tall=20
the disk images.

General source to deployment steps a user would follow:

Initial setup:

1) git checkout oe-core/bitbake/layers...
2) configure distribution and build environment (local.conf and distro.co=
nf files)
3) build distribution 'package-feed' recipe (or world), creating a local =
package=20
feed
4) [optional] push package feed to an external repository
5) construct rootfs/image/deployment based on image [recipe] and machine=20
configuration

Updates:

*) (distro.conf changes are not allowed, unless compatible)
1) Add or update recipes
2) Build new/updated recipes, updating the local package feed
3) [optional] push package feed to an external repository
4) construct rootfs/image/deployment based on image [recipe] and machine=20
configuration
-or-
   update an existing rootfs/image/deployment based on revised package fe=
eds

Note: for the normal usage scenario of today, step #3 and #4 of the initi=
al=20
setup can be ignored, and the image recipe will do exactly the same as to=
day.

There is some desire about supporting deployment for multiple machine typ=
es at=20
the same time.  While this may be useful, I believe it is out of scope wi=
th the=20
current work because it changes the workflow of OE.  The current workflow=
=20
assumes you are building for one machine at a time, but you may build mul=
tiple=20
machines in a single project/build directory.


General binary to deployment steps:
-----------------------------------

For a group of users, they are not distribution experts and expect someon=
e else=20
to give them the necessary distribution for their purposes.  To their eye=
s this=20
distribution is embedded specific, but is not a source based distribution=
.=20
Another way to look at this is starting with the embedded Linux distribut=
ion=20
created by OE, they want to be able to simply use the distribution (like =
Fedora,=20
or Debian) and create applications.

Initial setup:

1) Acquire a package feed
2) Construct rootfs/image/deployment based on image and machine configura=
tion

Update:

0) Start with an SDK or deployed image
1) Build new software components, using traditional package tools
2) [optional] push the packages to the feed
3) construct rootfs/image/deployment based on image and machine configura=
tion
-or-
   update an existing rootfs/image/deployment based on revised package fe=
eds



Tasks:
------

Functional requirements:

*) break up the filesystem generation, and deployment process into logica=
l steps=20
that can be run independently, with the appropriate input and configurati=
on

*) ability to run the steps internally to an OE-Core build, or externally=
 using=20
just configuration and package feeds as the input.  (Likely python, and e=
ven=20
bitbake may be runtime requirements for both internal and external execut=
ion of=20
steps.)

*) pluggable component model that allows the steps being run to change, a=
s well=20
as new steps to be added via layers and machine specific configurations

General tasks:

*) Work with OE community and propose the 'package-feed' recipes (or some=
thing=20
similar) to manage the create of distribution feeds.
    Goal: determine if a 'package-feed' recipe type is reasonable to be a=
dded=20
and can be defined in a way that it is useful
    Note: If 'package-feed' recipe is not an acceptable name,  I'm lookin=
g for a=20
suggestion of an alternative name.
    Note: Similarly there have been suggestions that confusion over the "=
task"=20
recipes should likely factor into this work as well.  One suggest was to =
use the=20
term "group".

*) Explore existing image recipes, and image classes and document existin=
g=20
control structures
    Goal: ensure that existing workflows are maintained

*) Cleanup of existing image recipes, image classes and related items
    Goal: Take the existing components and cleanup the work to clearly=20
differentiate the steps performed in the creation of an image
   Note: this is a first step toward the setting a defined, controllable =
list of=20
tasks per machine deployment (the default set of tasks will be the existi=
ng=20
behavior)

Filesystem generation tasks

*) Refactor deb, ipk, rpm ROOTFS generation
    *) deb - little to no additional changes expected
    *) ipk - little to no additional changes expected
    *) rpm - big changes, use zypper (or similar) for install vs RPM only=
 approach
   Goal: ensure that the ROOTFS generation is standalone for each filesys=
tem=20
type, and create the images in an efficient manner.
   Note: Much of the work is already done here, except as noted the RPM t=
ype=20
does not yet use a resolver framework such as Zypper.  (Introducing Zyppe=
r may=20
cause significant additional requirements for native tooling.  This may p=
rove to=20
be undesirable, so an alternative to Zypper may be more appropriate.)

*) Build filesystem generation to work external of the bitbake/OE environ=
ment
   Goal: allow a filesystem to be constructed from a  package feed, exter=
nally=20
of the "build" environment.
   Note: bitbake, python components and such may still be useful, but the=
=20
components should be runnable on either a host or target system.

*) Build a handoff to the deployment tasks
   Goal: A standard interface that can be used to seed the deployment tas=
ks
   Note: likely a pseudo controlled directory, or archive of some type
   Note: what we have today is likely enough, we just need to more clearl=
y=20
differentiate the steps

Deployment tasks

*) Implement kernel+initramfs (rootfs) creation
   Goal: Provide a kernel+initramfs that can be used as input to a differ=
ent=20
deployment task
   Note: investigate CONFIG_INITRAMFS_SOURCE, mkelfimage and potentially =
other=20
techniques
              the existing live cd/bootimg technique is syslinux based an=
d may=20
not be possible on non IA32 architectures
   Note: Build the (initrd) rootfs first, then the kernel in some=20
configurations, with the result being a built-in initrd in a single step

*) Implement archive image deployment
   Goal: ability to export a functional tar/cpio or other archive that co=
ntains=20
a fully configured filesystem
   Note: primary user is expected to be NFS, SDK, and other development u=
sers
   Note: likely not much work to do, as the existing system works fine

*) Implement disk image deployment
   Goal: ability to create a full disk image that includes multiple parti=
tions,=20
kernel and bootloader as specified by the user
   Note: this is a fairly complex set of tasks=85 see further tasks below=
 for more=20
detail

*) Implement disk image deployment: disk partitioning
   Goal: partition a disk image to match user configurations
   Note: may require root access and physical disks, would like this to w=
ork on=20
a file

*) Implement disk image deployment: disk partitioning: LVM/RAID/Partition=
=20
configurations
   Goal: Add advanced disk partitioning and setup, this may require creat=
ion and=20
configuration of filesystem components such as /etc config files.

*) Implement disk image deployment: construct partition filesystems
   Goal: Build a filesystem using ext2, ext3, ext4 or other disk based ty=
pes
   Note: some types may require root as they lack virtual setup files lik=
e=20
genext2fs.  loopback mounts may be one way to implement this, given appro=
priate=20
permissions

*) Implement disk image deployment: bootloader setup
   Goal: Implement a way to configure and install a boot loader onto the =
disk image

*) Implement disk image deployment: kernel deployment
   Goal: Implement a method to deploy a bootable kernel into an image

*) Implement ISO/HYBRID deployment
   Goal: Implement an ISO/HYBRID bootable image for CD/DVD/USB Flash, etc.
   Note: "live cd" like, use unionfs and appropriate RW storage to ensure=
 the=20
system functions.
   Note: This was previously implemented but was disabled due to bugs in =
the=20
kernel/userspace integration.

*) Implement flash deployment
   Goal: Ability to create on or more flash regions with appropriate depl=
oyment=20
components
   Note: components may include bootloaders, kernel, and filesystems

*) Implement flash deployment: construction filesystems
   Goal: Build flash based filesystems such as jffs2, crams, btrfs, squas=
hes, ubifs

*) Add an installer framework that can be used for deployment
   Goal: the installer feature would include installer recipe(s), package=
 feeds,=20
indexes and other components necessary to boot and install a runnable sys=
tem on=20
the target device
   Note: this installer framework would be used with any of the deploymen=
t=20
mechanisms (archive, disk, iso/hybrid, or flash) to build the installer i=
mage

*) bootloader configuration
   Goal: add a general framework to specify how to configure and install =
a=20
bootloader


