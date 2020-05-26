Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.823.1590515895168852608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 10:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=tJ+CXN8P;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXebz/skie44a6Y9+NSjnC/MZs5a23V2yG7DBN0IMzentKnA6neVUyqJm9PUkbnNoJtCTSH4RXmBTSYLY90sEwswf6sDTVSllI8kfkk7M+AkaLK1Wzsaww1z8Sovn2KgdivRyUQySZhYr73FAiTMvMiz1D79URxpBLta0k4xVkJmEipjQGcZCowEUI0TGbwqLPKoA3mZ4gsuXgcRqJxyRSMRjDDVQgSqBoceXvs9yhxbncZm9LRig9EzGF8v5AdM6Viu7GZxwQcdHL3FPEHAQ9b62A9TGuhlBJD0uWlisP2MYOC2RixKWaTtTwxY6wW0S8HFSKO0QmsFuinlgsjrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQXKFBRu94FYn+xTiniC/QznwxUgKYM++HeKfKqEo30=;
 b=dNduxJttdhvrWqt6cuqlvzMXulXRckXQbhHSaHModMU5B95cN6PUSw0ueOv8HnqnFg2a6bd4HG+dp85VfwUcYfPc3TSkGk7WISTAfdPV96GlQbKByaqcl5NmUcv+6QQUgwqIdQWoOsCzsRXCYZcNd3RA2H9RrJU2pQN7fOYxl+RTZ9djt27CnnuNA8djaSNsL4po8yMS7EaWJMC9VL72lyEdNEigUI/MoC+OMLq2ZlLbKs+Y8c1b98VbVFJsJGZ9of1yVXkZInRMj6Vt2hManUiIdlh4aVnPiHh8mYtk2jenBJhleJWxY/SMbf5PZDajBxToE+uJEgl8eexC4SbNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQXKFBRu94FYn+xTiniC/QznwxUgKYM++HeKfKqEo30=;
 b=tJ+CXN8PlJzSfQtKZvSgIDHxoZCe/dVclGbz940xIG9mRdE0hKLXIaZrk0ogswvgI1JoTlmU9etdraM7q7BNCCVxl7qNhS77nnE8XaWgetaSgKttJALACqyKeRIy6fNwD24Q1a8QPeTXTb+rk+27zNXOxAKTvgPPKgbmfr5yC2c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB2892.eurprd06.prod.outlook.com (2603:10a6:3:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 17:58:14 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 17:58:14 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [PATCH v3] classes: Add a new bbclass that abstracts the generation of FIT blobs
Date: Tue, 26 May 2020 20:57:55 +0300
Message-ID: <20200526175813.3130821-1-nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326214308.1042374-1-nandor.han@vaisala.com>
References: <20200326214308.1042374-1-nandor.han@vaisala.com>
X-ClientProxiedBy: HE1PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::34) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR0101CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 17:58:13 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c7852fe-7015-4fba-a9ed-08d8019e5c5f
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB2892AABECBB3D3974B20BFE485B00@HE1PR0602MB2892.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qYw4vMDXrbcc040JjV3oQw/VIBfn6urJ6ghRuDNm7b9yVPPrOHnrcbxOFV1PmQkxF6K0HEZ9Y3iMGG6d2Lpt1ZI4i7cAGVz5XCuHoTJfvphnTtY51M4DXHaUbn3D0RwHadTUG/o1nQtIqAQY5ADmmc1REDNdmezfr0s0CCwiyobjfWtSj4dkEa50unkJdrtrSCx5d459nMdY3LWO59uoGN2vmmJHUZu2VV02vM+qP/lF/C0H8yu2rFL1Ovt/MkC2gMcASlVANgcCU3M7qPiXw0abLlXmrROMjkd19xrYEuzA3cNfTPZqNnaZKCyzLaI18V81yDRVhxcwl9TR8wPo6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(136003)(39840400004)(396003)(316002)(5660300002)(6486002)(86362001)(8676002)(6666004)(4326008)(1076003)(8936002)(36756003)(26005)(16526019)(186003)(30864003)(66946007)(2906002)(6916009)(7696005)(2616005)(107886003)(52116002)(66556008)(44832011)(66476007)(956004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/5UkNBv1kgdmVHFrEUGkjFTl6bCJS2vNfR9Bvl1vawHXyrgA0VEXYbDCJtxHbtwMcVc1WXZFJ1MzRg3W16eqOP9KaiGV2ngoUaw31XBH0ZwpDgtwJWf2nAVLOBfS7vJTBkHABeEcWQR16VfV1jmNeQKWJ5N1IC/UA6biSUWNHTIkxrpf/1HzvjZ/KrwrKK7ScGKgf5CF98ejpJBER5vqc8X22NEzSi9hPx9hBhON+8kM7Ev99t00tfkuJY3n1vy2ZWY+uVnjofru50Ewt7ddydk/5dCwWFFQdUDy832YqBnPqcSHGZxrQCii2IKgoZz5vtlnqN7bAMdHv/GIOP32GiLoCPpMYpHODBf3IzuDSHl/sDaCf/0S84e/f0WBbTSVL/l8CLcGLstIjCBi7yveNPQwtBl8Hjes+tu+3TiQ3/qGHB61VANB+OtZgjSWp7cd89EvpcuxRbuystmvYyhrOokO+mkTlmRQZFSNRMpHN5g=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7852fe-7015-4fba-a9ed-08d8019e5c5f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 17:58:14.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gkT5n61YsJJ95++DWgKPqLfl8XQqc/WbgI+T3YCUlmmS8NdZ7FHu7aEmpKF+6ToSh6mde7QhJBihfEySuDDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2892
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

FIT format is very versatile allowing various combination of booting
sequences. In the same time different U-Boot boot stages can use FIT
blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
FIT blob). Because of the allowed level of customization, the generation
of a FIT blob using a fixed image tree source, becomes challenging and
increase the level of complexity where different configurations and
combinations are needed.

This bbclass will know how to generate a FIT blob, leaving the mechanics
of the process (dependencies, task order...) to be handled by the users
of the bbclass. In the same time will allow to separate the knowledge of
the FIT format leaving the user code cleaner and more readable.

Signed-off-by: Nandor Han <nandor.han@vaisala.com>
---

Notes:
    Testing
    -------

    1. linux-yocto_5.4.bbappend was modified to have the following configur=
ation:

    ```
    inherit fit-image

    KERNEL_IMAGE_NODE[name] =3D "kernel"
    KERNEL_IMAGE_NODE[description] =3D "${PF}"
    KERNEL_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/zImage")'
    KERNEL_IMAGE_NODE[type] =3D "kernel"
    KERNEL_IMAGE_NODE[arch] =3D "${ARCH}"
    KERNEL_IMAGE_NODE[os] =3D "linux"
    KERNEL_IMAGE_NODE[compression] =3D "none"
    KERNEL_IMAGE_NODE[load] =3D "${UBOOT_LOADADDRESS}"
    KERNEL_IMAGE_NODE[entry] =3D "${UBOOT_ENTRYPOINT}"
    KERNEL_IMAGE_NODE[hash] =3D "sha256"

    FDT_IMAGE_NODE[name] =3D "fdt"
    FDT_IMAGE_NODE[description] =3D "FDT blob"
    FDT_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone=
.dtb")'
    FDT_IMAGE_NODE[type] =3D "flat_dt"
    FDT_IMAGE_NODE[arch] =3D "${ARCH}"
    FDT_IMAGE_NODE[compression] =3D "none"
    FDT_IMAGE_NODE[hash] =3D "sha256"

    CONF1_CONF_NODE[name] =3D "conf"
    CONF1_CONF_NODE[description] =3D "Linux kernel and FDT blob"
    CONF1_CONF_NODE[kernel] =3D "kernel"
    CONF1_CONF_NODE[fdt] =3D "fdt"

    FIT_IMAGES_NODE =3D "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
    FIT_CONFIGURATIONS_NODE =3D "CONF1_CONF_NODE"
    FIT_CONFIGURATIONS_NODE[default] =3D "${@d.getVarFlag('CONF1_CONF_NODE'=
, 'name') or ""}"
    ```
    2. Build the kernel: `bitbake virtual/kernel`
    3. Verify that `image-fit.itb` is present in the build directory: PASS
    4. Disassemble the image using the command: `dtc -I dtb -O dts image-fi=
t.itb`
    5. Verify that the FIT source contains the expected configuration: PASS

    Changes since v1:
    ----------------
    - Change the format of short-log to "<target>: <summary>"

    Changes since v2:
    ----------------
    - rename the file from `fit-image` to `fit_image` to
    successfully export the class functions.
    - adding new sanity checks.
    - add missing dependency.
    - fix a variable reference in a debug log.

 meta/classes/fit_image.bbclass | 382 +++++++++++++++++++++++++++++++++
 1 file changed, 382 insertions(+)
 create mode 100644 meta/classes/fit_image.bbclass

diff --git a/meta/classes/fit_image.bbclass b/meta/classes/fit_image.bbclas=
s
new file mode 100644
index 0000000000..87d92db122
--- /dev/null
+++ b/meta/classes/fit_image.bbclass
@@ -0,0 +1,382 @@
+#
+# The class will facilitate the generation of FIT blobs.
+#
+# Glossary
+#    FIT - Flattened uImage Tree
+#
+# Requirements:
+#
+#    * The user need to specify the image content using the format specifi=
ed in the "FIT Image API" section.
+#
+# FIT Image API
+#
+# The bbclass is using variable and variable flags to declare the FIT imag=
e content.
+#
+#    * Sub-Images and Configuration Nodes
+#
+#       ** A sub-image node content is declared using the format `VAR_NODE=
[<property-name>] =3D <value>`.
+#         * VAR_NODE - freely selected name of the variable representing a=
 node.
+#         * <property-name> - a sub-image property (e.g. description, type=
...).
+#         * <value> - the property value.
+#             Depending of the property the value can support different fo=
rmats.
+#           ** Property Values Formats
+#
+#            string property
+#            ---------------
+#            format: "<text>" - in case the property expects a text.
+#                (e.g. IMAGE_NODE_KERNEL[type] =3D "kernel")
+#
+#            address property
+#            ----------------
+#            format: "<address>" - in case the property expects an address=
.
+#                (e.g. IMAGE_NODE_KERNEL[entry] =3D "0xABCDABCD")
+#
+#            hash property
+#            -------------
+#            format: "<hash type>" - for hash property the hash type needs=
 to be specified.
+#                (e.g. IMAGE_NODE_KERNEL[hash] =3D "sha256")
+#
+#            sub-image signature property
+#            ----------------------------
+#            format: "<algo>;<key-name-hint>;" - for image signature node.
+#                Both algorithm and key name needs to be provided.
+#                (e.g. IMAGE_NODE_KERNEL[signature] =3D "sha256,rsa2048;ke=
rnel;"
+#
+#            configuration signature property
+#            --------------------------------
+#            format: "<algo>;<key-name-hint>;<sub-image list>" - for confi=
guration signature properties algorithm,
+#                key name and sub-image nodes needs to be provided.
+#                (e.g. CONF_NODE_CONF1[signature] =3D "sha256,rsa2048;kern=
el;"kernel","fdt";")
+#
+#       ** Sub-Image and Configuration Nodes Flags
+#              See the code for supported flags.
+#
+#    * FIT_IMAGES_NODE - contains a list of variables used to declare the =
sub-images nodes, separated by space.
+#                    (e.g. FIT_IMAGES_NODE =3D "IMAGE_NODE_KERNEL IMAGE_NO=
DE_FDT")
+#
+#    * FIT_CONFIGURATIONS_NODE - contains a list of variables used to decl=
are the configuration nodes,
+#          separated by space. (e.g. FIT_CONFIGURATIONS_NODE =3D "CONF_NOD=
E_CONF1")
+#        ** Flags
+#           - "default": used to configure the default configuration node.
+#                 (e.g. FIT_CONFIGURATIONS_NODE[default] =3D "conf@0")
+#
+# Example:
+# This is part of a linux_%.bbappend recipe.
+#
+# KERNEL_IMAGE_NODE[name] =3D "kernel"
+# KERNEL_IMAGE_NODE[description] =3D "${PF}"
+# KERNEL_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/zImage")'
+# KERNEL_IMAGE_NODE[type] =3D "kernel"
+# KERNEL_IMAGE_NODE[arch] =3D "${ARCH}"
+# KERNEL_IMAGE_NODE[os] =3D "linux"
+# KERNEL_IMAGE_NODE[compression] =3D "none"
+# KERNEL_IMAGE_NODE[load] =3D "${UBOOT_LOADADDRESS}"
+# KERNEL_IMAGE_NODE[entry] =3D "${UBOOT_ENTRYPOINT}"
+# KERNEL_IMAGE_NODE[hash] =3D "sha256"
+#
+# FDT_IMAGE_NODE[name] =3D "fdt"
+# FDT_IMAGE_NODE[description] =3D "FDT blob"
+# FDT_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone.=
dtb")'
+# FDT_IMAGE_NODE[type] =3D "flat_dt"
+# FDT_IMAGE_NODE[arch] =3D "${ARCH}"
+# FDT_IMAGE_NODE[compression] =3D "none"
+# FDT_IMAGE_NODE[hash] =3D "sha256"
+#
+# CONF1_CONF_NODE[name] =3D "conf"
+# CONF1_CONF_NODE[description] =3D "Linux kernel and FDT blob"
+# CONF1_CONF_NODE[kernel] =3D "kernel"
+# CONF1_CONF_NODE[fdt] =3D "fdt"
+#
+# FIT_IMAGES_NODE =3D "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
+# FIT_CONFIGURATIONS_NODE =3D "CONF1_CONF_NODE"
+# FIT_CONFIGURATIONS_NODE[default] =3D "${@d.getVarFlag('CONF1_CONF_NODE',=
 'name') or ""}"
+#
+
+DEPENDS +=3D "\
+    dtc-native \
+    u-boot-mkimage-native \
+"
+
+FIT_IMAGE_DESCRIPTION ??=3D "Generic FIT image"
+FIT_IMAGE_FILENAME ??=3D "image-fit"
+FIT_IMAGE_UBOOT_MKIMAGE_OPTS ??=3D ""
+
+def get_subimage_node_rules():
+    """
+    Defines the properties format and validation for sub-image nodes.
+
+    :return: Return a dictionary with the format rules.
+    """
+
+    #
+    # Rules Format: [Mandatory, Template String, Dictionary keys]
+    # Mandatory: True, False - used to verify if this property is mandator=
y for generating the image.
+    #            Note: Doesn't take in consideration the conditionally man=
datory property.
+    #                  (see: U-Boot/doc/uImage.FIT/source_file_format.txt)
+    # Template String: Property content format. Used to generate the param=
eter content.
+    # Dictionary Keys: Keys used to be replaced in the Template String.
+    #
+    from collections import OrderedDict
+
+    rules =3D OrderedDict()
+
+    rules['description'] =3D [True, '=3D "$value"', ["value"]]
+    rules['data'] =3D [True, '=3D $value', ["value"]]
+    rules['type'] =3D [True, '=3D "$value"', ["value"]]
+    rules['arch'] =3D [False, '=3D "$value"', ["value"]]
+    rules['os'] =3D [False, '=3D "$value"', ["value"]]
+    rules['compression'] =3D [True, '=3D "$value"', ["value"]]
+    rules['load'] =3D [False, '=3D <$value>', ["value"]]
+    rules['entry'] =3D [False, '=3D <$value>', ["value"]]
+    rules['hash'] =3D [False, '{ algo =3D "$algo"; }', ['algo']]
+    rules['signature'] =3D [False, '{ algo =3D "$algo"; key-name-hint =3D =
"$key"; }', ['algo', 'key']]
+
+    return rules
+
+
+def get_conf_node_rules():
+    """
+    Defines the properties format and validation for configuration nodes.
+
+    :return: Return a dictionary with the format rules.
+    """
+    #
+    # Rules Format: [Mandatory, Template String, Dictionary keys]
+    # Mandatory: True, False - used to verify if this property is mandator=
y for generating the image.
+    #            Note: Doesn't take in consideration the conditionally man=
datory property.
+    #                  (see: U-Boot/doc/uImage.FIT/source_file_format.txt)
+    # Template String: Property content format. Used to generate the param=
eter content.
+    # Dictionary Keys: Keys used to be replaced in the Template String.
+    #
+    from collections import OrderedDict
+
+    rules =3D OrderedDict()
+
+    rules['description'] =3D [True, '=3D "$value"', ["value"]]
+    rules['kernel'] =3D [True, '=3D "$value"', ["value"]]
+    rules['ramdisk'] =3D [False, '=3D "$value"', ["value"]]
+    rules['fdt'] =3D [False, '=3D "$value"', ["value"]]
+    rules['loadables'] =3D [False, '=3D "$value"', ["value"]]
+    rules['signature'] =3D [False, '{ algo =3D "$algo"; key-name-hint =3D =
"$key"; sign-images =3D $images; }',
+                          ['algo', 'key', 'images']]
+
+    return rules
+
+
+def generate_node(name, params, rules):
+    """
+    Generates a node.
+
+    :param name: Node name.
+    :param params: A dictionary containing the properties values.
+    :param rules: A dictionary containing the properties values validation=
 and format.
+
+    :return: A string containing the node, including the new line characte=
rs.
+    """
+    from string import Template
+
+    content =3D []
+
+    for rule in rules.keys():
+        if rule in params.keys():
+            content.append('{param} {value}; '.format(
+                param=3Drule,
+                value=3DTemplate(rules[rule][1]).substitute(
+                    dict(zip(rules[rule][2], params[rule].split(';'))))))
+        elif rules[rule][0]:
+            bb.fatal('Missing mandatory parameter "{param}" from "{section=
}" section'.format(param=3Drule, section=3Dname))
+
+    content =3D """
+                     """.join(content)
+    node =3D """   {name} {{
+                     {content}
+              }};
+           """.format(name=3Dname, content=3Dcontent)
+
+    return node
+
+
+def get_section_configuration(var, d):
+    """
+    Generates a string build from variable's flags.
+
+    :param var: variable to extract the flags.
+    :param d: bitbake environment.
+
+    :return: A string with the format '<flag1> =3D <value1>; <flag2> =3D <=
value2>;...'.
+    """
+    flags =3D d.getVarFlags(var)
+    if flags is not None:
+        flags =3D dict((flag, d.expand(value))
+                     for flag, value in list(flags.items()))
+    else:
+        flags =3D {}
+
+    configuration =3D ''.join((
+              """{name} =3D "{value}";
+              """.format(name=3Dname, value=3Dvalue) for name, value in fl=
ags.items()))
+
+    return configuration
+
+
+def get_section_properties(var, d):
+    """
+    Extract the nodes and parameters for a section.
+
+    :param var: variable containing the variable names of the nodes that a=
re part of this section.
+    :param d: bitbake environment.
+
+    :return: a list containing dictionaries with section nodes parameters.
+    """
+    nodes =3D []
+    parameters =3D {}
+
+    for node in d.getVar(var).split():
+        parameters =3D d.getVarFlags(node)
+        if parameters is not None:
+            parameters =3D dict((parameter, d.expand(value))
+                              for parameter, value in list(parameters.item=
s()))
+            nodes.append(parameters)
+
+    return nodes
+
+
+def generate_section(var, rules, d):
+    """
+    Generates a section node (configuration or sub-image).
+
+    :param var: Variable to extract the node names.
+    :param rules: Rules to use for generating this section.
+    :param d: bitbake environment.
+
+    :return: A string containing the section, including the new line chara=
cters.
+    """
+
+    section =3D get_section_configuration(var, d)
+
+    nodes_parameters =3D get_section_properties(var, d)
+    for parameters in nodes_parameters:
+        name =3D parameters.pop('name')
+        node =3D generate_node(name, parameters, rules)
+        section +=3D node
+
+    return section
+
+
+def get_fit_image_template():
+    """
+    Get the FIT format.
+
+    :return: A Template string containing the FIT image format.
+    """
+    from string import Template
+
+    template =3D Template("""/dts-v1/;
+        /{
+             description =3D "$description";
+             #address-cells =3D <1>;
+             images {
+                 $images_section
+             };
+             configurations {
+                 $configurations_section
+             };
+        };""")
+    return template
+
+
+def generate_image_tree_source(d):
+    """
+    Generates a string containing the image tree source.
+
+    :return: A string representing the image tree.
+    """
+    from string import Template
+
+    values =3D {}
+    values['description'] =3D d.getVar('FIT_IMAGE_DESCRIPTION')
+
+    image_rules =3D get_subimage_node_rules()
+    if d.getVar('FIT_IMAGES_NODE', False) is None:
+       bb.fatal("Please add the FIT image nodes to FIT_IMAGES_NODE variabl=
e.")
+    values['images_section'] =3D generate_section('FIT_IMAGES_NODE', image=
_rules, d)
+
+    conf_rules =3D get_conf_node_rules()
+    if d.getVar('FIT_CONFIGURATIONS_NODE', False) is None:
+       bb.fatal("Please add the FIT configuration nodes to FIT_CONFIGURATI=
ONS_NODE variable.")
+    values['configurations_section'] =3D generate_section('FIT_CONFIGURATI=
ONS_NODE', conf_rules, d)
+
+    image_tree_source =3D get_fit_image_template().substitute(values)
+
+    return image_tree_source
+
+
+def generate_image_blob(file_name, image, d):
+    """
+    Generates a FIT blob.
+
+    :param file_name: FIT blob file name.
+    :param image: String containing the image tree source.
+    :param d: Bitbake environment.
+    """
+    import tempfile
+    import subprocess
+
+    bb.debug(1, "Generated FIT source is:\n {image}".format(image=3Dimage)=
)
+
+    builddir =3D d.getVar('B')
+    blob_file_name =3D file_name + '.itb'
+
+    try:
+        fd, faux =3D tempfile.mkstemp(dir=3Dbuilddir, prefix=3Dfile_name, =
suffix=3D".its")
+        with os.fdopen(fd, "w") as f:
+            f.write(image)
+
+        mkimage_opts =3D d.getVar('FIT_IMAGE_UBOOT_MKIMAGE_OPTS').split() =
or ""
+        cmd =3D ['mkimage', '-f', faux]
+        cmd.extend(mkimage_opts)
+        cmd.append('{output_name}'.format(output_name=3Dblob_file_name))
+
+        ret =3D subprocess.run(
+            cmd,
+            check=3DTrue,
+            universal_newlines=3DTrue,
+            cwd=3Dbuilddir,
+            stderr=3Dsubprocess.STDOUT,
+            stdout=3Dsubprocess.PIPE)
+
+        bb.debug(1, "Command for generating the FIT blob is:\n {cmd}".form=
at(cmd=3D" ".join(ret.args)))
+
+    except subprocess.CalledProcessError as e:
+        bb.fatal('Failed to generate the FIT blob: {message}: {output}'.fo=
rmat(
+            message=3Dstr(e), output=3De.stdout))
+    finally:
+        os.remove(faux)
+
+
+def generate_fit_image(file_name, d):
+    """
+    Create and generate FIT blob.
+
+    :param file_name: FIT blob file name.
+    :param d: Bitbake environment.
+    """
+    image =3D generate_image_tree_source(d)
+    generate_image_blob(file_name, image, d)
+
+
+python fit_image_do_generate_fit_image() {
+    generate_fit_image(d.getVar('FIT_IMAGE_FILENAME'), d)
+}
+
+do_generate_fit_image[vardeps] +=3D " \
+    ${FIT_CONFIGURATIONS_NODE} \
+    ${FIT_IMAGES_NODE} \
+    FIT_CONFIGURATIONS_NODE \
+    FIT_IMAGES_NODE \
+    FIT_IMAGE_FILENAME \
+"
+
+addtask do_generate_fit_image after do_compile before do_deploy
+
+EXPORT_FUNCTIONS do_generate_fit_image
--=20
2.24.1

