Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web11.1583.1585259018541589867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 14:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=djCiAhjh;
 spf=pass (domain: vaisala.com, ip: 40.107.21.76, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3qisw1KZU2HdV2zVwtgSa0mPw01OBinpu5j9AeivdApyEqFdOK6JNPE/Umg+E04VU8BRGW7Auxhd/+4N51jmhjg+mSBmyXE9jEw8o1FR9NAGcBG1oPwiHJhNRTQeYbAa+1Rah6Tuq+Y4LLCPwo5+3HKPSXnsDhpgZ278REyo8ALVzGrNxfr+hCrIrWY/Tx/osAgYyTxq1htDVbDbCmGFLkyCjxUVtqdtQt34VyrDWRDR3ZRFHhlUEUoo0msg6016vfSJ/jjdSVYl2PnLdfwzFRUjfKNgDAsg4VLoy8reCJEHrPkVEL9524RrEgUCzRTbiYh3AjS0DUYmGtVhZRtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZKiGM0i+CAAbcGJYW9h6Wf2g9bvSpntiK01hy5/PJw=;
 b=UGgPNCvLc4qSzZD1l5yqfTo2EzLOpXh1EyO8xI3ffs7dknyAn6tLdykNy4gKxitXv1Hi8VJOjXp5/fdWwJEuCCZzHqKUwx0fUyVFaKKBqJlYJ6/n3ku8q/qIlv5SgQSqRBhFq5uhgvmGDrwzAcOlN8bfCyDpFdWoXD237Z1vVc7fHAi7VoJWh8uyadqmpgso5g331CRTJiTHQ07LHAgoDEY9bUzv1ZR9TIAGD53Q64OZcjmNgLd9ZTC63n+DOqYGcxVyddyOOVQ36DzP+0QezglNYRzW7QQV2EbNcRaDcN64d9TxCn1WfE9cYAiImk4PCaTTTtsPaktiATN737cfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZKiGM0i+CAAbcGJYW9h6Wf2g9bvSpntiK01hy5/PJw=;
 b=djCiAhjhdQY7nk9MXJqmN0VLPlYOj93Zd/pF3BHMxE/K4Np9KkjvRo1YqlDsH9lSVnp0ZpvMxssI2rgR9cLGjp20Sau50JkECALyJsZIqruMX31Aul5z5XFke33jKaawL7wqJae9+A59MWTR2IeGRBbcKnGiKyfnU8NlU+1x0rg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=nandor.han@vaisala.com; 
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (52.133.5.22) by
 HE1PR0602MB3257.eurprd06.prod.outlook.com (10.171.198.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Thu, 26 Mar 2020 21:43:36 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::1d6b:70de:9b21:de6]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::1d6b:70de:9b21:de6%2]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 21:43:35 +0000
From: nandor.han@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [PATCH] Add a new bbclass that abstracts the generation of FIT blobs
Date: Thu, 26 Mar 2020 23:43:08 +0200
Message-ID: <20200326214308.1042374-1-nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: AM3PR05CA0124.eurprd05.prod.outlook.com
 (2603:10a6:207:2::26) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.fi (2001:14ba:3e3:9900::3) by AM3PR05CA0124.eurprd05.prod.outlook.com (2603:10a6:207:2::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18 via Frontend Transport; Thu, 26 Mar 2020 21:43:35 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [2001:14ba:3e3:9900::3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6acdb900-1b4d-4369-f177-08d7d1cebcc1
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB32572E9A3B4E3E5543E3A36785CF0@HE1PR0602MB3257.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(86362001)(5660300002)(81166006)(16526019)(44832011)(6916009)(30864003)(2906002)(1076003)(316002)(36756003)(478600001)(6486002)(81156014)(8676002)(2616005)(8936002)(186003)(6512007)(107886003)(8886007)(6666004)(66476007)(52116002)(6506007)(66556008)(66946007)(4326008);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LR50Rc3bTyKsfZSf0dmk8Pa0GSJ+1/IKyBEllgKEBscDwyC6yauXWYEKd0Pe066HZL0PowxpMZpMNXPSiW5Bs6XXoGJ+sX4AAKg11rvl3p+FFO7rCpW9hxg3yLmPrnj4DUkxJANofD6p1JvWYIeVVb0vSEHFe3JsSxDGxayR6ZlAMo/aeU3+R/kODH1CK/zJLGcj2Tu4j+Tz0F0ATRdtddSErG/SGr3y5ABUwpjwzZ+yqb5scqIXR4FD3x8sab6jRRFs65rZYeGvH2W1bWpqTYJLgCOi09FrERejFdE3R37TQC8kHZQYRPFiXG0eFKO/KtoQEyyuRgdS3rF55MBYHksui5zElcNyFEdbSgTrgF69DkDR4SPsEJyprFxv4z7jyZ8WJl+Ir1Esb0Ul7hZ1BZqncmTG15xruK+z1eHABH/py6UsD0Hcx83ztjm/t3GV
X-MS-Exchange-AntiSpam-MessageData: 
	lewRLOMgmx30AOZSnhTSTW/MCdccXi9MxhoWEvFHbhvOZaSHA0fTReDsQBjptrGRauM1HItcqB3tkbvlhJzqYII9+U0CKLcpI7d+SasgJ3pWLUJldrphj/IxSSMvVOtZtdWrQqD2Y71oZMnCh83v8vHem0ypI+nLB0lsFIjtAts=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acdb900-1b4d-4369-f177-08d7d1cebcc1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 21:43:35.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0fSNOShyozruCnqkGZVeaJYXA/b3fbGz7FLeYdvmSDBUmYWGNp1rADr4PEjwQPYVtM24vLaecWCGiKON+0WYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3257
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
   =20
    1. linux-yocto_5.4.bbappend was modified to have the following configur=
ation:
   =20
    ```
    inherit fit-image
   =20
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
   =20
    FDT_IMAGE_NODE[name] =3D "fdt"
    FDT_IMAGE_NODE[description] =3D "FDT blob"
    FDT_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone=
.dtb")'
    FDT_IMAGE_NODE[type] =3D "flat_dt"
    FDT_IMAGE_NODE[arch] =3D "${ARCH}"
    FDT_IMAGE_NODE[compression] =3D "none"
    FDT_IMAGE_NODE[hash] =3D "sha256"
   =20
    CONF1_CONF_NODE[name] =3D "conf"
    CONF1_CONF_NODE[description] =3D "Linux kernel and FDT blob"
    CONF1_CONF_NODE[kernel] =3D "kernel"
    CONF1_CONF_NODE[fdt] =3D "fdt"
   =20
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

 meta/classes/fit-image.bbclass | 377 +++++++++++++++++++++++++++++++++
 1 file changed, 377 insertions(+)
 create mode 100644 meta/classes/fit-image.bbclass

diff --git a/meta/classes/fit-image.bbclass b/meta/classes/fit-image.bbclas=
s
new file mode 100644
index 0000000000..e087244c7a
--- /dev/null
+++ b/meta/classes/fit-image.bbclass
@@ -0,0 +1,377 @@
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
+# IMAGE_NODE_KERNEL[name] =3D "kernel@0"
+# IMAGE_NODE_KERNEL[description] =3D "${PF}"
+# IMAGE_NODE_KERNEL[data] =3D "/incbin/("./arch/${ARCH}/boot/zImage")"
+# IMAGE_NODE_KERNEL[type] =3D "kernel"
+# IMAGE_NODE_KERNEL[arch] =3D "${ARCH}"
+# IMAGE_NODE_KERNEL[os] =3D "linux"
+# IMAGE_NODE_KERNEL[compression] =3D "none"
+# IMAGE_NODE_KERNEL[load] =3D "${UBOOT_LOADADDRESS}"
+# IMAGE_NODE_KERNEL[entry] =3D "${UBOOT_ENTRYPOINT}"
+# IMAGE_NODE_KERNEL[hash] =3D "sha256"
+#
+# IMAGE_NODE_FDT[name] =3D "fdt@0"
+# IMAGE_NODE_FDT[type] =3D "flat_dt"
+# IMAGE_NODE_FDT[arch] =3D "${ARCH}"
+# IMAGE_NODE_FDT[compression] =3D "none"
+# IMAGE_NODE_FDT[hash] =3D "sha256"
+#
+# CONF_NODE_CONF1[name] =3D "conf@0"
+# CONF_NODE_CONF1[description] =3D "Linux kernel and FDT blob"
+# CONF_NODE_CONF1[kernel] =3D "kernel@0"
+# CONF_NODE_CONF1[fdt] =3D "fdt@0"
+#
+# FIT_IMAGES_NODE =3D "IMAGE_NODE_KERNEL IMAGE_NODE_FDT"
+#
+# FIT_CONFIGURATIONS_NODE =3D "CONF_NODE_CONF1"
+# FIT_CONFIGURATIONS_NODE[default] =3D "${@d.getVarFlag('CONF_NODE_CONF1',=
 'name') or ""}"
+#
+
+DEPENDS +=3D "\
+    u-boot-mkimage-native \
+"
+
+FIT_IMAGE_DESCRIPTION ??=3D "Generic FIT image"
+FIT_IMAGE_FILENAME ??=3D "image-fit"
+FIT_IMAGE_UBOOT_MKIMAGE_OPTS ??=3D ""
+
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
+            bb.fatal('Missing mandatory parameter: {param} from {name} sec=
tion'.format(param=3Drule, section=3Dname))
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
+    values['images_section'] =3D generate_section('FIT_IMAGES_NODE', image=
_rules, d)
+
+    conf_rules =3D get_conf_node_rules()
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
+python fit-image_do_generate_fit_image() {
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

