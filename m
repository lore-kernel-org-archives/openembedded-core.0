Return-Path: <christian.charreyre@cioinfoindus.fr>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 16:21:05 UTC
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
	[80.12.242.128])
	by mail.openembedded.org (Postfix) with ESMTP id D30A265EE6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 16:21:05 +0000 (UTC)
Received: from [192.168.1.15] ([86.210.248.153]) by mwinf5d63 with ME
	id ygDW1n00H3KKMLN03gDWeR; Tue, 06 May 2014 18:13:31 +0200
X-ME-Helo: [192.168.1.15]
X-ME-Auth: Y2hyaXN0aWFuLmNoYXJyZXlyZS5jaW9Ad2FuYWRvby5mcg==
X-ME-Date: Tue, 06 May 2014 18:13:31 +0200
X-ME-IP: 86.210.248.153
Message-ID: <53690A2A.7030106@cioinfoindus.fr>
Date: Tue, 06 May 2014 18:13:30 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1398242491-2373-1-git-send-email-christian.charreyre@cioinfoindus.fr>
	<5357FFB1.50207@linux.intel.com>
In-Reply-To: <5357FFB1.50207@linux.intel.com>
Subject: Re: [PATCH] tree: new recipe for version 1.6.0
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
X-List-Received-Date: Tue, 06 May 2014 16:21:08 -0000
X-Groupsio-MsgNum: 52878
Content-Type: multipart/mixed; boundary="------------080501060304000309070701"

--------------080501060304000309070701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hello Saul,

Le 23/04/2014 20:00, Saul Wold a écrit :
> On 04/23/2014 01:41 AM, Christian Charreyre wrote:
>> This patch creates the recipe for the command tree, which is a recursive
>> directory listing command that produces a depth indented listing of 
>> files,
>> which is colorized ala dircolors if the LS_COLORS environment 
>> variable is
>> set and output is to tty
>>
>
> Thanks for the submission, a couple of questions and comments below.
>
> Why is this needed in oe-core?  Are there many people interested in it?
>
> Maybe it should start in meta-openemebedded/meta-oe

I didn't know where to locate it. meta-openemebedded/meta-oeis OK for 
me, I'll change the patch accordingly.
>
>> Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
>> ---
>>   .../tree/tree/0001-adapt-Makefile.patch            |   44 
>> ++++++++++++++++++++
>>   meta/recipes-support/tree/tree_1.6.0.bb |   15 +++++++
>>   2 files changed, 59 insertions(+)
>>   create mode 100644 
>> meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
>>   create mode 100644 meta/recipes-support/tree/tree_1.6.0.bb
>>
>> diff --git a/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch 
>> b/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
>> new file mode 100644
>> index 0000000..bcc19c9
>> --- /dev/null
>> +++ b/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
>> @@ -0,0 +1,44 @@
>> +Adapt Makefile to cross compilation and tool environment
>> +
> This 0001-adapt-Makefile.patch should have an Upstream-Status and 
> Signed-off-by tags also.
>
> Please see: 
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

OK, done in next version

>
>> +Index: tree-1.6.0/Makefile
>> +===================================================================
>> +--- tree-1.6.0.orig/Makefile    2011-06-24 16:25:27.000000000 +0200
>> ++++ tree-1.6.0/Makefile    2014-04-22 16:53:14.817331834 +0200
>> +@@ -16,23 +16,23 @@
>> + # along with this program; if not, write to the Free Software
>> + # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 
>> 02111-1307  USA
>> +
>> +-prefix = /usr
>> ++prefix = ${DESTDIR}/usr
>> +
>> +-CC=gcc
>> ++CC ?= gcc
>> +
>> + VERSION=1.6.0
>> + TREE_DEST=tree
>> + BINDIR=${prefix}/bin
>> + MAN=tree.1
>> +-MANDIR=${prefix}/man/man1
>> ++MANDIR=${prefix}/share/man/man1
>> + OBJS=tree.o unix.o html.o xml.o hash.o color.o
>> +
>> + # Uncomment options below for your particular OS:
>> +
>> + # Linux defaults:
>> + #CFLAGS=-ggdb -Wall -DLINUX -D_LARGEFILE64_SOURCE 
>> -D_FILE_OFFSET_BITS=64
>> +-CFLAGS=-O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>> +-LDFLAGS=-s
>> ++CFLAGS ?= -O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE 
>> -D_FILE_OFFSET_BITS=64
>> ++LDFLAGS ?= -s
>> +
>> + # Uncomment for FreeBSD:
>> + #CFLAGS=-O2 -Wall -fomit-frame-pointer
>> +@@ -97,7 +97,7 @@
>> +     install -d $(BINDIR)
>> +     install -d $(MANDIR)
>> +     if [ -e $(TREE_DEST) ]; then \
>> +-        install -s $(TREE_DEST) $(BINDIR)/$(TREE_DEST); \
>> ++        install $(TREE_DEST) $(BINDIR)/$(TREE_DEST); \
>> +     fi
>> +     install doc/$(MAN) $(MANDIR)/$(MAN)
>> +
>> diff --git a/meta/recipes-support/tree/tree_1.6.0.bb 
>> b/meta/recipes-support/tree/tree_1.6.0.bb
>> new file mode 100644
>> index 0000000..f1ca376
>> --- /dev/null
>> +++ b/meta/recipes-support/tree/tree_1.6.0.bb
>> @@ -0,0 +1,15 @@
>> +DESCRIPTION = "a recursive directory listing command."
> This is more of a SUMMARY, can you expand of the DESCRIPTIION?

I'll try

>
>> +SECTION = "console/utils"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>> +
>> +SRC_URI = 
>> "http://mama.indstate.edu/users/ice/${PN}/src/${PN}-${PV}.tgz \
>> +    file://0001-adapt-Makefile.patch \
>> +"
>> +
>> +SRC_URI[md5sum] = "04e967a3f4108d50cde3b4b0e89e970a"
>> +SRC_URI[sha256sum] = 
>> "4dc470a74880338b01da41701d8db90d0fb178877e526d385931a007d68d7591"
>> +
>> +inherit autotools
>> +
> Does it really use autotools?  I think it can just use the standard 
> do_compile/do_install and does not require autotools.

I used autotools inheritance to avoid to explicitely define 
do_compile/do_install. Whet is the good method if I don't inherit from 
autotools.
Do I define them explicitely in the recipe or is there a way to inherit 
from another class ?

>
>> +CFLAGS_append = " -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
>>
>
> Thanks again
>     Sau!
>
>

Waiting for your reply to send a corrected patch.

Regards.


-- 

Christian Charreyre
CIO Informatique Industrielle
11 Avenue Marigny 13014 Marseille
Tél : 04 95 05 19 41
http://www.cioinfoindus.fr




--------------080501060304000309070701
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"

begin:vcard
fn:Christian  Charreyre
n:Charreyre;Christian 
org:CIO Informatique Industrielle
adr;dom:;;11 Avenue Marigny;Marseille;;13014
email;internet:christian.charreyre@cioinfoindus.fr
tel;work:04 95 05 19 41
url:http://www.cioinfoindus.fr
version:2.1
end:vcard


--------------080501060304000309070701--
