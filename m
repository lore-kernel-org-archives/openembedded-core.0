Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D820C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 15:50:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.64615.1716220238723406317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 08:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60C92DA7
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:51:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D171F3F762
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:50:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/manual: remove obsolete CROPS and Eclipse manually testing scripts
Date: Mon, 20 May 2024 15:50:34 +0000
Message-Id: <20240520155034.2066096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 15:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199596

The Eclipse plugin is very dead, we don't need to carry the manual test
guide for it.

CROPS has its own automated testing, nobody is doing the testing by hand.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/manual/crops.json          | 294 ---------------------
 meta/lib/oeqa/manual/eclipse-plugin.json | 322 -----------------------
 2 files changed, 616 deletions(-)
 delete mode 100644 meta/lib/oeqa/manual/crops.json
 delete mode 100644 meta/lib/oeqa/manual/eclipse-plugin.json

diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops=
.json
deleted file mode 100644
index 5cfa6538432..00000000000
--- a/meta/lib/oeqa/manual/crops.json
+++ /dev/null
@@ -1,294 +0,0 @@
-[
-    {
-        "test": {
-            "@alias": "crops-default.crops-default.sdkext_eSDK_devtool_b=
uild_make",
-            "author": [
-                {
-                    "email": "francisco.j.pedraza.gonzalez@intel.com",
-                    "name": "francisco.j.pedraza.gonzalez@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "IMPORTANT NOTE: The firsts 5 steps refer =
to configuration of the environment to run the rest of the steps. These o=
nly apply for CROPS-eSDK.    \n\n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": " Initiate your Crops-esdk environment as =
it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n"=
,
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Create the following tree of files  <crop=
s-esdk-workdir-workspace>/sdkext/files/myapp <crops-esdk-workdir-workspac=
e>/sdkext/files/myapp_cmake   \n\n\n",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": " Create the following files withing the m=
yapp directory  myapp.c and the Makefile. Write the following inside of e=
ach file: \n---------------------------------------- \nMakefile should co=
ntain  \n\nall: myapp  \n\nmyapp: myapp.o \n\t$(CC) $(LDFLAGS) $< -o $@  =
\n\nmyapp.o: myapp.c  \n\t$(CC) $(CFLAGS) -c $< -o $@ \n\nclean: \n\trm -=
rf myapp.o myapp  \n\n-----------------------------  \nmyapp.c  shold con=
tain  \n\n\n#include <stdio.h>    \n\nint \nmain(int argc, char *argv[]) =
\n{ \n\tprintf(\"Hello world\\n\"); \n \n\treturn 0; \n} \n--------------=
----------------------  \n\n",
-                    "expected_results": "be sure that the indentations o=
n the makefile are tabs not spaces.  \n\n"
-                },
-                "5": {
-                    "action": " Create the following files within the my=
app_cmake directory CMakeLists.txt and myapp.c. Write the following insid=
e each file:  \n\n------------------------------------ \nCMakeLists.txt s=
hould contain:  \n\ncmake_minimum_required (VERSION 2.6) \nproject (myapp=
) \n# The version number. \nset (myapp_VERSION_MAJOR 1) \nset (myapp_VERS=
ION_MINOR 0)  \n\n# add the executable \nadd_executable (myapp myapp.c)  =
\n\ninstall(TARGETS myapp \nRUNTIME DESTINATION bin)  \n\n---------------=
--------------------------- \nmyapp.c should contain:  \n\n#include <stdi=
o.h>     \n\nint  \nmain(int argc, char *argv[])  \n{ \n\tprintf(\"Hello =
world\\n\");  \n\n\treturn 0; \n} \n-------------------------------------=
------------  \n\n",
-                    "expected_results": "Be sure that the indentations o=
n CMakeLists.txt is tabs not spaces."
-                },
-                "6": {
-                    "action": " source environment-setup-i586-poky-linux=
  \n\n",
-                    "expected_results": "This should output a message th=
at says SDK environment now set up; additionally you may now run devtool =
to perform development tasks etc etc ...   \n\n"
-                },
-                "7": {
-                    "action": " run command which devtool  \n\n",
-                    "expected_results": "this should output the director=
y of the devtool script and it should be within the sdk workdir you are w=
orking in.  \n\n  "
-                },
-                "8": {
-                    "action": "devtool add myapp <directory>(this is mya=
pp dir)    \n\n\n",
-                    "expected_results": "The directory you should input =
is the myapp directory. This should automatically create the recipe myapp=
.bb under <crops-esdk-workdir-workspace>/recipes/myapp/myapp.bb"
-                },
-                "9": {
-                    "action": " devtool build myapp  \n\n",
-                    "expected_results": "This should compile an image"
-                },
-                "10": {
-                    "action": " devtool reset myapp  ",
-                    "expected_results": "This cleans sysroot of the myap=
p recipe, but it leaves the source tree intact. meaning it does not erase=
."
-                }
-            },
-            "summary": "sdkext_eSDK_devtool_build_make"
-        }
-    },
-    {
-        "test": {
-            "@alias": "crops-default.crops-default.sdkext_devtool_build_=
esdk_package",
-            "author": [
-                {
-                    "email": "francisco.j.pedraza.gonzalez@intel.com",
-                    "name": "francisco.j.pedraza.gonzalez@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "IMPORTANT NOTE: The firsts 5 steps refer =
to configuration of the environment to run the rest of the steps. These o=
nly apply for CROPS-eSDK.    \n\n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": " Initiate your Crops-esdk environment as =
it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n"=
,
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": " Create the following tree of files    <c=
rops-esdk-workdir-workspace>/sdkext/files/myapp/ \n <crops-esdk-workdir-w=
orkspace>/sdkext/files/myapp_cmake  \n\n",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": " Create the following files withing the m=
yapp directory  myapp.c and the Makefile. Write the following inside of e=
ach file: \n---------------------------------------- \nMakefile should co=
ntain  \n\nall: myapp  \n\nmyapp: myapp.o \n\t$(CC) $(LDFLAGS) $< -o $@ \=
n\nmyapp.o: myapp.c  \n\t$(CC) $(CFLAGS) -c $< -o $@ \n\nclean: \n\trm -r=
f myapp.o myapp  \n\n-----------------------------  \nmyapp.c  shold cont=
ain  \n\n#include <stdio.h>   \n\nint \nmain(int argc, char *argv[]) \n{ =
\n\tprintf(\"Hello world\\n\"); \n \n\treturn 0; \n} \n------------------=
------------------  \n\n",
-                    "expected_results": "be sure that the indentations o=
n the makefile are tabs not spaces.  \n\n"
-                },
-                "5": {
-                    "action": " Create the following files within the my=
app_cmake directory CMakeLists.txt and myapp.c. Write the following insid=
e each file:  \n\n------------------------------------ \nCMakeLists.txt s=
hould contain:  \n\ncmake_minimum_required (VERSION 2.6) \nproject (myapp=
) \n# The version number. \nset (myapp_VERSION_MAJOR 1) \nset (myapp_VERS=
ION_MINOR 0)  \n\n# add the executable \nadd_executable (myapp myapp.c)  =
\n\ninstall(TARGETS myapp \nRUNTIME DESTINATION bin)  \n\n---------------=
--------------------------- \nmyapp.c should contain:  \n\n#include<stdio=
.h>     \n\nint  \nmain(int argc, char *argv[])  \n{ \n\tprintf(\"Hello w=
orld\\n\");  \n\n\treturn 0; \n} \n--------------------------------------=
-----------  \n\n",
-                    "expected_results": "Be sure that the indentations o=
n CMakeLists.txt is tabs not spaces.  \n\n"
-                },
-                "6": {
-                    "action": " source environment-setup-i586-poky-linux=
  \n\n",
-                    "expected_results": "This should output a message th=
at says SDK environment now set up; additionally you may now run devtool =
to perform development tasks etc etc ...  \n\n"
-                },
-                "7": {
-                    "action": " run command which devtool  \n\n",
-                    "expected_results": " this should output the directo=
ry of the devtool script and it should be within the sdk workdir you are =
working in.  \n\n"
-                },
-                "8": {
-                    "action": " devtool add myapp <directory>  (this is =
myapp dir)  \n\n",
-                    "expected_results": " The directory you should input=
 is the myapp directory. This should automatically create the recipe myap=
p.bb under <crops-esdk-workdir-workspace>/recipes/myapp/myapp.bb  \n\n"
-                },
-                "9": {
-                    "action": " devtool package myapp  \n\n",
-                    "expected_results": " you should expect a package cr=
eation of myapp and it should be under the  /tmp/deploy/  \n\n"
-                },
-                "10": {
-                    "action": " devtool reset myapp  ",
-                    "expected_results": "This cleans sysroot of the myap=
p recipe, but it leaves the source tree intact. meaning it does not erase=
.\n</package_format>"
-                }
-            },
-            "summary": "sdkext_devtool_build_esdk_package"
-        }
-    },
-    {
-        "test": {
-            "@alias": "crops-default.crops-default.sdkext_devtool_build_=
cmake",
-            "author": [
-                {
-                    "email": "francisco.j.pedraza.gonzalez@intel.com",
-                    "name": "francisco.j.pedraza.gonzalez@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "IMPORTANT NOTE: The firsts 5 steps refer =
to configuration of the environment to run the rest of the steps. These o=
nly apply for CROPS-eSDK.    \n\n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": " Initiate your Crops-esdk environment as =
it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n"=
,
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": " Create the following tree of files    <c=
rops-esdk-workdir-workspace>/sdkext/files/myapp \n <crops-esdk-workdir-wo=
rkspace>/sdkext/files/myapp_cmake  \n\n",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": " Create the following files withing the m=
yapp directory  myapp.c and the Makefile. Write the following inside of e=
ach file: \n---------------------------------------- \nMakefile should co=
ntain  \n\nall: myapp  \n\nmyapp: myapp.o \n\t$(CC) $(LDFLAGS) $< -o $@ \=
n\nmyapp.o: myapp.c  \n\t$(CC) $(CFLAGS) -c $< -o $@ \n\nclean: \n\trm -r=
f myapp.o myapp  \n\n-----------------------------  \nmyapp.c  shold cont=
ain  \n\n#include <stdio.h>   \n\nint \nmain(int argc, char *argv[]) \n{ =
\n\tprintf(\"Hello world\\n\"); \n \n\treturn 0; \n} \n------------------=
------------------  \n\n",
-                    "expected_results": "be sure that the indentations o=
n the makefile are tabs not spaces.   \n\n"
-                },
-                "5": {
-                    "action": " Create the following files within the my=
app_cmake directory CMakeLists.txt and myapp.c. Write the following insid=
e each file:  \n\n------------------------------------ \nCMakeLists.txt s=
hould contain:  \n\ncmake_minimum_required (VERSION 2.6) \nproject (myapp=
) \n# The version number. \nset (myapp_VERSION_MAJOR 1) \nset (myapp_VERS=
ION_MINOR 0)  \n\n# add the executable \nadd_executable (myapp myapp.c)  =
\n\ninstall(TARGETS myapp \nRUNTIME DESTINATION bin)  \n\n---------------=
--------------------------- \nmyapp.c should contain:  \n\n#include    \n=
\nint  \nmain(int argc, char *argv[])  \n{ \n\tprintf(\"Hello world\\n\")=
;  \n\n\treturn 0; \n} \n------------------------------------------------=
-  \n\n",
-                    "expected_results": "Be sure that the indentations o=
n CMakeLists.txt is tabs not spaces.  \n\n"
-                },
-                "6": {
-                    "action": " source environment-setup-i586-poky-linux=
  \n\n",
-                    "expected_results": "This should output a message th=
at says SDK environment now set up; additionally you may now run devtool =
to perform development tasks etc etc ...  \n\n"
-                },
-                "7": {
-                    "action": " run command which devtool  \n\n",
-                    "expected_results": "this should output the director=
y of the devtool script and it should be within the sdk workdir you are w=
orking in.  \n\n"
-                },
-                "8": {
-                    "action": " devtool add myapp <directory>   (this is=
 myapp_cmake dir)  \n\n",
-                    "expected_results": "The directory you should input =
is the myapp_cmake directory. This should automatically create the recipe=
 myapp.bb under <crops-esdk-workdir-workspace>/recipes/myapp/myapp.bb  \n=
\n"
-                },
-                "9": {
-                    "action": " devtool build myapp  \n\n",
-                    "expected_results": "This should compile an image  \=
n\n"
-                },
-                "10": {
-                    "action": " devtool reset myapp  ",
-                    "expected_results": "This cleans sysroot of the myap=
p recipe, but it leaves the source tree intact. meaning it does not erase=
.  "
-                }
-            },
-            "summary": "sdkext_devtool_build_cmake"
-        }
-    },
-    {
-        "test": {
-            "@alias": "crops-default.crops-default.sdkext_extend_autotoo=
ls_recipe_creation",
-            "author": [
-                {
-                    "email": "francisco.j.pedraza.gonzalez@intel.com",
-                    "name": "francisco.j.pedraza.gonzalez@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "IMPORTANT NOTE: The firsts 2 steps refer =
to configuration of the environment to run the rest of the steps. These o=
nly apply for CROPS-eSDK.    \n\n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Initiate your Crops-esdk environment as i=
t says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": " source environment-setup-i586-poky-linux=
  \n\n",
-                    "expected_results": " This should output a message t=
hat says SDK environment now set up; additionally you may now run devtool=
 to perform development tasks etc etc ...   \n\n"
-                },
-                "4": {
-                    "action": "run command which devtool  \n\n",
-                    "expected_results": "this should output the director=
y of the devtool script and it should be within the sdk workdir you are w=
orking in.   \n\n"
-                },
-                "5": {
-                    "action": "devtool sdk-install -s libxml2  \n\n",
-                    "expected_results": "this should install libxml2   \=
n\n"
-                },
-                "6": {
-                    "action": "devtool add librdfa  https://github.com/r=
dfa/librdfa  \n\n",
-                    "expected_results": "This should automatically creat=
e the recipe librdfa.bb under /recipes/librdfa/librdfa.bb   \n\n"
-                },
-                "7": {
-                    "action": "devtool build librdfa  \n\n",
-                    "expected_results": "This should compile   \n\n"
-                },
-                "8": {
-                    "action": "devtool reset librdfa  ",
-                    "expected_results": "This cleans sysroot of the libr=
dfa recipe, but it leaves the source tree intact. meaning it does not era=
se."
-                }
-            },
-            "summary": "sdkext_extend_autotools_recipe_creation"
-        }
-    },
-    {
-        "test": {
-            "@alias": "crops-default.crops-default.sdkext_devtool_kernel=
module",
-            "author": [
-                {
-                    "email": "francisco.j.pedraza.gonzalez@intel.com",
-                    "name": "francisco.j.pedraza.gonzalez@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "IMPORTANT NOTE: The firsts 2 steps refer =
to configuration of the environment to run the rest of the steps. These o=
nly apply for CROPS-eSDK.    \n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": " Initiate your Crops-esdk environment as =
it says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n"=
,
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "source environment-setup-i586-poky-linux =
  \n\n",
-                    "expected_results": "This should output a message th=
at says SDK environment now set up; additionally you may now run devtool =
to perform development tasks etc etc ...   \n \n"
-                },
-                "4": {
-                    "action": "run command which devtool  \n\n",
-                    "expected_results": "this should output the director=
y of the devtool script and it should be within the sdk workdir you are w=
orking in.   \n\n"
-                },
-                "5": {
-                    "action": "devtool add kernel-module-hello-world htt=
ps://git.yoctoproject.org/git/kernel-module-hello-world \n\n",
-                    "expected_results": "This should automatically creat=
e the recipe kernel-module-hello-world.bb under <crops-esdk-workdir-works=
pace>/recipes/kernel-module-hello-world/kernel-module-hello-world.bb "
-                },
-                "6": {
-                    "action": "devtool build kernel-module-hello-world  =
 \n\n",
-                    "expected_results": "This should compile an image   =
\n\n"
-                },
-                "7": {
-                    "action": "devtool reset kernel-module-hello-world  =
 ",
-                    "expected_results": "This cleans sysroot of the kern=
el-module-hello-world recipe, but it leaves the source tree intact. meani=
ng it does not erase."
-                }
-            },
-            "summary": "sdkext_devtool_kernelmodule"
-        }
-    },
-    {
-        "test": {
-            "@alias": "crops-default.crops-default.sdkext_recipes_for_no=
dejs",
-            "author": [
-                {
-                    "email": "francisco.j.pedraza.gonzalez@intel.com",
-                    "name": "francisco.j.pedraza.gonzalez@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "IMPORTANT NOTE: The firsts 2 steps refer =
to configuration of the environment to run the rest of the steps. These o=
nly apply for CROPS-eSDK.    \n\n\nlets say variable npm =3D npm://regist=
ry.npmjs.org;name=3Dwinston;version=3D2.2.0   \n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Initiate your Crops-esdk environment as i=
t says in wiki https://github.com/crops/docker-win-mac-docs/wiki   \n\n",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "source environment-setup-i586-poky-linux =
  \n\n",
-                    "expected_results": "This should output a message th=
at says SDK environment now set up; additionally you may now run devtool =
to perform development tasks etc etc ...   \n\n"
-                },
-                "4": {
-                    "action": "run command which devtool   \n\n",
-                    "expected_results": "this should output the director=
y of the devtool script and it should be within the sdk workdir you are w=
orking in.  \n\n"
-                },
-                "5": {
-                    "action": " 4a) git clone git://git.openembedded.org=
/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openem=
bedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/lay=
ers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://regi=
stry.npmjs.org;name=3Dnpm;version=3D2.2.0\"   \n\n",
-                    "expected_results": " This should automatically crea=
te the recipe npm.bb under /recipes/npm/npm.bb  \n\n"
-                },
-                "6": {
-                    "action": "devtool build npm   \n\n",
-                    "expected_results": "This should compile an image  \=
n\n"
-                },
-                "7": {
-                    "action": " devtool reset npm",
-                    "expected_results": "This cleans sysroot of the npm =
recipe, but it leaves the source tree intact. meaning it does not erase."
-                }
-            },
-            "summary": "sdkext_recipes_for_nodejs"
-        }
-    }
-]
diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/man=
ual/eclipse-plugin.json
deleted file mode 100644
index 6c110d0656e..00000000000
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ /dev/null
@@ -1,322 +0,0 @@
-[
-    {
-        "test": {
-            "@alias": "eclipse-plugin.eclipse-plugin.support_SSH_connect=
ion_to_Target",
-            "author": [
-                {
-                    "email": "ee.peng.yeoh@intel.com",
-                    "name": "ee.peng.yeoh@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "In Eclipse, swich to Remote System Explor=
er to create a connention baseed on SSH, input the remote target IP addre=
ss as the Host name, make sure disable the proxy in Window->Preferences->=
General->Network Connection, set Direct as Active Provider field.  ",
-                    "expected_results": "the connection based on SSH cou=
ld be set up."
-                },
-                "2": {
-                    "action": "Configure connection from Eclipse: Run->R=
un Configurations->C/C++ Remote Application\\ ->New Connection->General->=
SSH Only  ",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Then right click to connect, input the us=
er ID and password.  ",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "expand the connection, it will show the S=
ftp Files etc.   \nNOTE. Might need to change dropbear to openssh and add=
 the packagegroup-core-eclipse-debug recipe",
-                    "expected_results": ""
-                }
-            },
-            "summary": "support_SSH_connection_to_Target"
-        }
-    },
-    {
-        "test": {
-            "@alias": "eclipse-plugin.eclipse-plugin.Launch_QEMU_from_Ec=
lipse",
-            "author": [
-                {
-                    "email": "ee.peng.yeoh@intel.com",
-                    "name": "ee.peng.yeoh@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Set the Yocto ADT's toolchain root locati=
on, sysroot location and kernel, in the menu Window -> Preferences -> Yoc=
to ADT.   \n \n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "wget  https://downloads.yoctoproject.org/=
releases/yocto/yocto-$VERSION/machines/qemu/qemux86/ (ex:core-image-sato-=
sdk-qemux86-date-rootfs-tar-bz2) \nsource /opt/poky/version/environment-s=
etup-i585-poky-linux  \n\nExtract qemu with runqemu-extract-sdk /home/use=
r/file(ex.core-image-sato-sdk-qemux86.bz2) \n/home/user/qemux86-sato-sdk =
 \n\n",
-                    "expected_results": " Qemu can be lauched normally."
-                },
-                "3": {
-                    "action": "(a)Point to the Toolchain:  \n \nIf you a=
re using a stand-alone pre-built toolchain, you should be pointing to the=
 /opt/poky/{test-version} directory as Toolchain Root Location. This is t=
he default location for toolchains installed by the ADT Installer or by h=
and. If ADT is installed in other location, use that location as Toolchai=
n location.\nIf you are using a system-derived toolchain, the path you pr=
ovide for the Toolchain Root Location field is the Yocto Project's build =
directory.  \n \n           E.g:/home/user/yocto/poky/build \n",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "(b)Specify the Sysroot Location: \nSysroo=
t Location is the location where the root filesystem for the target hardw=
are is created on the development system by the ADT Installer (SYSROOT in=
 step 2 of the case ADT installer Installation).  \n   \n         Local :=
     e.g: /home/user/qemux86-sato-sdk \nUsing ADT : e.g :/home/user/test-=
yocto/qemux86  \n\n",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "(c)Select the Target Architecture:  \n \n=
The target architecture is the type of hardware you are going to use or e=
mulate. Use the pull-down Target Architecture menu to make your selection=
.  \n \n\n",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "(d) QEMU: \nSelect this option if you wil=
l be using the QEMU emulator. Specify the Kernel matching the QEMU archit=
ecture you are using. \n      wget  https://downloads.yoctoproject.org/re=
leases/yocto/yocto-$VERSION/machines/qemu/qemux86/bzImage-qemux86.bin \n =
     e.g: /home/$USER/yocto/adt-installer/download_image/bzImage-qemux86.=
bin  \n\n",
-                    "expected_results": ""
-                },=09
-                "7": {
-                    "action": "(e) select OK to save the settings.  \n\n=
\n1: In the Eclipse toolbar, expose the Run -> External Tools menu. Your =
image should appear as a selectable menu item.  \n2: Select your image in=
 the navigation pane to launch the emulator in a new window. \n3: If need=
ed, enter your host root password in the shell window at the prompt. This=
 sets up a Tap 0 connection needed for running in user-space NFS mode. \n=
",
-                    "expected_results": ""
-                }			=09
-            },
-            "summary": "Launch_QEMU_from_Eclipse"
-        }
-    },
-    {
-        "test": {
-            "@alias": "eclipse-plugin.eclipse-plugin.Relocatable_SDK_-_C=
_-_Build_Hello_World_ANSI_C_Autotools_Project",
-            "author": [
-                {
-                    "email": "ee.peng.yeoh@intel.com",
-                    "name": "ee.peng.yeoh@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Launch a QEMU of target environment.(Refe=
rence to case \"ADT - Launch qemu by eclipse\") ",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Select File -> New -> Project.",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Double click C/C++.",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Click C or C++ Project to create the proj=
ect.",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Expand Yocto ADT Project.",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "Select Hello World ANSI C Autotools Proje=
ct.",
-                    "expected_results": ""
-                },
-                "7": {
-                    "action": "Put a name in the Project name. Do not us=
e hyphens as part of the name. \n \n",
-                    "expected_results": ""
-                },
-                "8": {
-                    "action": "Click Next.",
-                    "expected_results": ""
-                },
-                "9": {
-                    "action": "Add information in the Author and Copyrig=
ht notice fields. \n1",
-                    "expected_results": ""
-                },
-                "10": {
-                    "action": "Click Finish. \n1",
-                    "expected_results": ""
-                },
-                "11": {
-                    "action": "If the \"open perspective\" prompt appear=
s, click \"Yes\" so that you open the C/C++ perspective. \n1",
-                    "expected_results": ""
-                },
-                "12": {
-                    "action": "In the Project Explorer window, right cli=
ck the project -> Reconfigure project. \n1",
-                    "expected_results": ""
-                },
-                "13": {
-                    "action": "In the Project Explorer window, right cli=
ck the project -> Build project. \n1",
-                    "expected_results": "Under the Project files, a new =
folder appears called Binaries. This indicates that the compilation have =
been successful and the project binary have been created. \n"
-                },
-                "14": {
-                    "action": "Right click it again and Run as -> Run Co=
nfigurations.  \n\t\t\tUnder Run Configurations expand \"C/C++ Remote App=
lication\". A configuration for the current project should appear. Clicki=
ng it will display the configuration settings. \n\t\t\tin \"C/C++ Applica=
tion\" field input Remote Absolute File path for C/C++ Application. e.g.:=
 /home/root/myapplication \n\t\t\tIn \"Connection\" drop-down list make s=
ure a TCF connection is set up for your target. If not, create a new one =
by clicking the New button. \n1",
-                    "expected_results": "step 14 to step 16 -> Build suc=
ceed and the console outputs Hello world, you can also check the output o=
n target."
-                },
-                "15": {
-                    "action": "After all settings are done, select the R=
un button on the bottom right corner \n\n1",
-                    "expected_results": ""
-                },
-                "16": {
-                    "action": "Repeat the steps 14-15, but instead of us=
ing Run Configurations use Debug Configurations: \nRight click it again a=
nd Debug as -> Debug Configurations \nUnder Debug Configurations expand \=
"C/C++ Remote Application\". A configuration for the current project shou=
ld appear. Clicking it will display the configuration settings. \nin \"C/=
C++ Application\" field input Remote Absolute File path for C/C++ Applica=
tion.\ne.g.: /home/root/myapplication \nIn \"Connection\" drop-down list =
make sure a TCF connection is set up for your target. If not, create a ne=
w one by clicking the New button \n1",
-                    "expected_results": ""
-                },
-                "17": {
-                    "action": "After all settings are done, select the D=
ebug button on the bottom right corner",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Relocatable_SDK_-_C_-_Build_Hello_World_ANSI_C_A=
utotools_Project"
-        }
-    },
-    {
-        "test": {
-            "@alias": "eclipse-plugin.eclipse-plugin.Relocatable_SDK_-_C=
++_-_Build_Hello_World_C++_Autotools_project",
-            "author": [
-                {
-                    "email": "ee.peng.yeoh@intel.com",
-                    "name": "ee.peng.yeoh@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Launch a QEMU of target environment.(Refe=
rence to case \"ADT - Launch qemu by eclipse\") ",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Select File -> New -> Project. ",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Double click C/C++. ",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Click C or C++ Project to create the proj=
ect. ",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Expand Yocto ADT Project. ",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "Select Hello World ANSI C++ Autotools Pro=
ject. ",
-                    "expected_results": ""
-                },
-                "7": {
-                    "action": "Put a name in the Project name. Do not us=
e hyphens as part of the name.  \n \n",
-                    "expected_results": ""
-                },
-                "8": {
-                    "action": "Click Next.",
-                    "expected_results": ""
-                },
-                "9": {
-                    "action": "Add information in the Author and Copyrig=
ht notice fields.",
-                    "expected_results": ""
-                },
-                "10": {
-                    "action": "Click Finish. \n1",
-                    "expected_results": ""
-                },
-                "11": {
-                    "action": "If the \"open perspective\" prompt appear=
s, click \"Yes\" so that you open the C/C++ perspective. \n1",
-                    "expected_results": ""
-                },
-                "12": {
-                    "action": "In the Project Explorer window, right cli=
ck the project -> Reconfigure project. \n1",
-                    "expected_results": ""
-                },
-                "13": {
-                    "action": "In the Project Explorer window, right cli=
ck the project -> Build project. \n\n1",
-                    "expected_results": "under the Project files, a new =
folder appears called Binaries. This indicates that the compilation have =
been successful and the project binary have been created.  \n"
-                },
-                "14": {
-                    "action": "Right click it again and Run as -> Run Co=
nfigurations. \n\t\t\tUnder Run Configurations expand \"C/C++ Remote Appl=
ication\". A configuration for the current project should appear. Clickin=
g it will display the configuration settings. \n\t\t\tin \"C/C++ Applicat=
ion\" field input Remote Absolute File path for C/C++ Application. e.g.: =
/home/root/myapplication \n\t\t\tIn \"Connection\" drop-down list make su=
re a TCF connection is set up for your target. If not, create a new one b=
y clicking the New button. \n1",
-                    "expected_results": "step 14 to step 16 -> Build suc=
ceed and the console outputs Hello world, you can also check the output o=
n target."
-                },
-                "15": {
-                    "action": "After all settings are done, select the R=
un button on the bottom right corner \n\n1",
-                    "expected_results": ""
-                },
-                "16": {
-                    "action": "Repeat the steps 14-15, but instead of us=
ing Run Configurations use Debug Configurations: \n\t\tRight click it aga=
in and Debug as -> Debug Configurations \n\t\tUnder Debug Configurations =
expand \"C/C++ Remote Application\". A configuration for the current proj=
ect should appear. Clicking it will display the configuration settings. \=
n\t\tin \"C/C++ Application\" field input Remote Absolute File path for C=
/C++ Application. \n\t\te.g.: /home/root/myapplication \n\t\tIn \"Connect=
ion\" drop-down list make sure a TCF connection is set up for your target=
. If not, create a new one by clicking the New button \n1",
-                    "expected_results": ""
-                },
-                "17": {
-                    "action": "After all settings are done, select the D=
ebug button on the bottom right corner",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Relocatable_SDK_-_C++_-_Build_Hello_World_C++_Au=
totools_project"
-        }
-    },
-    {
-        "test": {
-            "@alias": "eclipse-plugin.eclipse-plugin.Build_Eclipse_Plugi=
n_from_source",
-            "author": [
-                {
-                    "email": "laurentiu.serban@intel.com",
-                    "name": "laurentiu.serban@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Clone eclipse-poky source.   \n    \n    =
- git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
-                    "expected_results": "Eclipse plugin is successfully =
installed  \n\nDocumentation is there. For example if you have release yo=
cto-2.0.1 you will found on   https://downloads.yoctoproject.org/releases=
/yocto/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like =
org.yocto.doc-development-$date.zip  \n  \n"
-                },
-                "2": {
-                    "action": "Checkout correct tag.  \n\n    - git chec=
kout <eclipse-version>/<yocto-version> \n\n",
-                    "expected_results": "After plugin is build you must =
have  4 archive in foder scripts from eclipse-poky:  \n     - org.yocto.b=
c - mars-master-$date.zip  \n     - org.yocto.doc - mars-master-$date.zip=
    --> documentation  \n     - org.yocto.sdk - mars-master-$date.zip    =
   \n     - org.yocto.sdk - mars-master-$date.-archive.zip  --> plugin  "
-                },
-                "3": {
-                    "action": "Move to scripts/ folder.  \n\n",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Run ./setup.sh  \n\n",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "When the script finishes, it prompts a co=
mmand to issue to build the plugin. It should look similar to the followi=
ng:  \n\n$ ECLIPSE_HOME=3D/eclipse-poky/scripts/eclipse ./build.sh /&1 | =
tee -a build.log  \n\nHere, the three arguments to the build script are t=
ag name, branch for documentation and release name.  \n\n",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "On an eclipse without the Yocto Plugin, s=
elect \"Install New Software\" from Help pull-down menu  \n\n",
-                    "expected_results": ""
-                },
-                "7": {
-                    "action": "Select Add and from the dialog choose Arc=
hive...  Look for the *archive.zip file that was built previously with th=
e build.sh script. Click OK.  \n\n",
-                    "expected_results": ""
-                },
-                "8": {
-                    "action": "Select all components and proceed with In=
stallation of plugin. Restarting eclipse might be required.\n",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Build_Eclipse_Plugin_from_source"
-        }
-    },
-    {
-        "test": {
-            "@alias": "eclipse-plugin.eclipse-plugin.Eclipse_Poky_instal=
lation_and_setup",
-            "author": [
-                {
-                    "email": "ee.peng.yeoh@intel.com",
-                    "name": "ee.peng.yeoh@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Install SDK  \n\ta)Download https://autob=
uilder.yocto.io/pub/releases//toolchain/x86_64/poky-glibc-x86_64-core-\ti=
mage-sato-i586-toolchain-.sh  \n\tb)Run the SDK installer and accept the =
default installation directory ",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Install \"Eclipse IDE for C/C++ Developer=
s\" Oxygen release (4.7.0)  \n\ta) Go to https://www.eclipse.org/download=
s/packages/all, click \"Oxygen R\"  \n\tb) Click to download the build fo=
r your OS  \n\tc) Click \"Download\" button to download from a mirror  \n=
\td) Run \"tar xf\" to extract the downloaded archive  ",
-                    "expected_result": ""
-                },
-                "3": {
-                    "action": "Install \"Eclipse IDE for C/C++ Developer=
s\" Oxygen release (4.7.0) (Continue)  \n\te) Run \"eclipse/eclipse\" to =
start Eclipse  \n\tf) Optional step for host machine within Intel network=
: In Eclipse workbench window, go to \"Window\" menu -> \"Preferences...\=
".  \n\tg) In \"Preferences\" dialog, go to \"General\" -> \"Network Conn=
ections\", set \"Active Provider\" to \"Manual\". In \"Proxy \tentries\" =
table, select HTTP and click \"Edit\" and enter host \"proxy-chain.intel.=
com\" port 911, click OK. Repeat for HTTPS with port 912 \nClick OK to cl=
ose \"Preferences\" dialog.  \n\th) Go to \"File\" menu -> \"Restart\" to=
 restart Eclipse for proxy settings to take effect. ",
-                    "expected_result": ""
-                },
-                "4": {
-                    "action": "Install Eclipse Poky plugins  \n\ta) Down=
load https://autobuilder.yocto.io/pub/releases/<yocto-version>/eclipse-pl=
ugin/<eclipse-version>/org.yocto.sdk-development-<date>-archive.zip   \n\=
tb) In Eclipse workbench window, go to \"Help\" menu -> \"Install New Sof=
tware...\"  \n\tc) In \"Install\" dialog, click \"Add...\" button  \n\td)=
 In \"Add Repository\" dialog, enter \"Eclipse Poky\" for (repository) Na=
me, click \"Archive...\"  ",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Install Eclipse Poky plugins (continue)  =
\n\te) In \"Repository archive\" browse dialog, select the downloaded Ecl=
ipse Poky repository archive  \n\tf) Back in \"Add Repository\" dialog, c=
lick \"OK\"  \n\tg) Back in \"Install\" dialog, make sure \"Work with:\" =
is set to \"Eclipse Poky\" repository, tick \"Yocto Project \tDocumentati=
on Plug-in\" and \"Yocto Project SDK Plug-in\", click \"Next >\" and veri=
fy plugins/features name/version, \tclick \"Next >\" and accept license a=
greement, click \"Finish\"  \n\th) If \"Security Warning\" dialog appears=
, click \"OK\" to install unsigned content.  \n\ti) In \"Software Updates=
\" dialog, click \"Yes\" to restart Eclipse to complete Eclipse Poky plug=
ins installation. ",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "Setup Eclipse Poky to use SDK  \n\ta) In =
Eclipse workbench window, go to \"Window\" menu -> \"Preferences\".  \n\t=
b) In \"Preferences\" window, go to \"Yocto Project SDK\", in \"Cross Com=
piler Options\" frame, select \"Standalone pre-\tbuilt toolchain\".  ",
-                    "expected_results": "Eclipse Poky plugins installed =
and running successfully, e.g. observe that \"Yocto Project Tools\" menu =
is available on Eclipse workbench window."
-                }
-            },
-            "summary": "Eclipse_Poky_installation_and_setup"
-        }
-    }
-]
--=20
2.34.1


