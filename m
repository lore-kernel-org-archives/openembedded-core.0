Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.13875.1585321916389749273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 08:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N9UswFdq;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: zbooth.dev@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id j9so9076871ilr.7
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCnFscH1NFUoFannHd36M/nTc2iFacWC7dP2JMQ/pr0=;
        b=N9UswFdqov7muecGUvaOelFUG/TtLlL5eegqeoYaBfKu/awYPRo1OCmQ0QzLUSFe9l
         2QwUDYwPHvafFVWS1b6B3+E66jPQb5l3YzT163lAEPJWcMu19tIMYI9Oh/uK68H95xIV
         +4wRoJM3tHFeUwEr86KwLfX2Eivjgw3wPQO+EdjD1XBHCu7ikHdTr7ECZpmcqb/qfZ2S
         G2FWiEkYVKB/G4qEjOqa7qLcOe8c89+tU729LiWARZe7Au93HofBRhxkM5SGZx4xpF5P
         pyJCNO06ADdOCE8fE+aLP0kziNk/SGtGdyG0p9aXdps4TEm9PP2frbaeeBCy5H8dJ6pW
         9Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VCnFscH1NFUoFannHd36M/nTc2iFacWC7dP2JMQ/pr0=;
        b=h7vcUpHf0y6V1nkEW3DfD0ooPLgDLNCL+oBtXFpHqQPHtuKJgBZW0UsPCAo55qM8Em
         jyQZaKAJKfeq55h+jLoxdSFt3oKoUWB0/fepNxIucPgHerJRmOs7PdwZpQO79NKBDEB/
         vsCehzve47WQOm5C2c4wXJc8t91WV39Y/tvRYajDwjj/u5Ff00wPpA+0Jdy3WTHEvxRg
         aQ1CjOVDONMVii2Q20UbtIWL/RyS7CzFPCQuOzAkIb9RJ0N2/H++kBzigF2sfwDA2qdy
         n4SZS9DqVzK2WJN/iA6wQJcjCpYhaw6+lwsM04HlQ7uJzOhT5nO0Q8/oPl8oh7azkrSs
         /8Nw==
X-Gm-Message-State: ANhLgQ2t9Kc/+w7lPmyJmHpaZpUFtSwNE9NljmNUbqro/DRODAsWW4vB
	5iBlkwD8Brz2fLwNJq8pWrGbSrZ4Njc+cRpPF8E=
X-Google-Smtp-Source: ADFU+vtbNDIri27bB6WS8vDOLc1D6Du8QMqVRU1H4KU8zpw0Yshigu2xurm2YwzXOCBrRCwqv1fF3pwfO3kr0sV8dpE=
X-Received: by 2002:a92:8316:: with SMTP id f22mr14391908ild.169.1585321915593;
 Fri, 27 Mar 2020 08:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200326214308.1042374-1-nandor.han@vaisala.com> <20200327082918.1213345-1-nandor.han@vaisala.com>
In-Reply-To: <20200327082918.1213345-1-nandor.han@vaisala.com>
From: "Zach Booth" <zbooth.dev@gmail.com>
Date: Fri, 27 Mar 2020 10:11:44 -0500
Message-ID: <CAFhEjg1kxfhcxngtCpsZ3bxvGr63p3Sf26mwSbMtZ3eVKc=SYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] classes: Add a new bbclass that abstracts the generation of FIT blobs
To: Nandor Han <nandor.han@vaisala.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 27, 2020 at 3:29 AM Nandor Han <nandor.han@vaisala.com> wrote:
>
> FIT format is very versatile allowing various combination of booting
> sequences. In the same time different U-Boot boot stages can use FIT
> blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
> FIT blob). Because of the allowed level of customization, the generation
> of a FIT blob using a fixed image tree source, becomes challenging and
> increase the level of complexity where different configurations and
> combinations are needed.
>
> This bbclass will know how to generate a FIT blob, leaving the mechanics
> of the process (dependencies, task order...) to be handled by the users
> of the bbclass. In the same time will allow to separate the knowledge of
> the FIT format leaving the user code cleaner and more readable.
>
> Signed-off-by: Nandor Han <nandor.han@vaisala.com>

This class looks very useful, but I did have a question. How would you
account for creating nodes dynamically? One use case of this would be
adding a DT node for each reference in KERNEL_DEVICETREE. Would that
functionality be expected to go in the recipe including this class or
the class itself?

Thanks,
Zach

> ---
>
> Notes:
>     Testing
>     -------
>
>     1. linux-yocto_5.4.bbappend was modified to have the following configuration:
>
>     ```
>     inherit fit-image
>
>     KERNEL_IMAGE_NODE[name] = "kernel"
>     KERNEL_IMAGE_NODE[description] = "${PF}"
>     KERNEL_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/zImage")'
>     KERNEL_IMAGE_NODE[type] = "kernel"
>     KERNEL_IMAGE_NODE[arch] = "${ARCH}"
>     KERNEL_IMAGE_NODE[os] = "linux"
>     KERNEL_IMAGE_NODE[compression] = "none"
>     KERNEL_IMAGE_NODE[load] = "${UBOOT_LOADADDRESS}"
>     KERNEL_IMAGE_NODE[entry] = "${UBOOT_ENTRYPOINT}"
>     KERNEL_IMAGE_NODE[hash] = "sha256"
>
>     FDT_IMAGE_NODE[name] = "fdt"
>     FDT_IMAGE_NODE[description] = "FDT blob"
>     FDT_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone.dtb")'
>     FDT_IMAGE_NODE[type] = "flat_dt"
>     FDT_IMAGE_NODE[arch] = "${ARCH}"
>     FDT_IMAGE_NODE[compression] = "none"
>     FDT_IMAGE_NODE[hash] = "sha256"
>
>     CONF1_CONF_NODE[name] = "conf"
>     CONF1_CONF_NODE[description] = "Linux kernel and FDT blob"
>     CONF1_CONF_NODE[kernel] = "kernel"
>     CONF1_CONF_NODE[fdt] = "fdt"
>
>     FIT_IMAGES_NODE = "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
>     FIT_CONFIGURATIONS_NODE = "CONF1_CONF_NODE"
>     FIT_CONFIGURATIONS_NODE[default] = "${@d.getVarFlag('CONF1_CONF_NODE', 'name') or ""}"
>     ```
>     2. Build the kernel: `bitbake virtual/kernel`
>     3. Verify that `image-fit.itb` is present in the build directory: PASS
>     4. Disassemble the image using the command: `dtc -I dtb -O dts image-fit.itb`
>     5. Verify that the FIT source contains the expected configuration: PASS
>
>     Changes since v1:
>     ----------------
>     - Change the format of short-log to "<target>: <summary>"
>
>     Changes since v2:
>     ----------------
>     - rename the file from `fit-image` to `fit_image` to
>     successfully export the class functions.
>     - adding new sanity checks.
>     - add missing dependency.
>     - fix a variable reference in a debug log.
>
>  meta/classes/fit_image.bbclass | 382 +++++++++++++++++++++++++++++++++
>  1 file changed, 382 insertions(+)
>  create mode 100644 meta/classes/fit_image.bbclass
>
> diff --git a/meta/classes/fit_image.bbclass b/meta/classes/fit_image.bbclass
> new file mode 100644
> index 0000000000..87d92db122
> --- /dev/null
> +++ b/meta/classes/fit_image.bbclass
> @@ -0,0 +1,382 @@
> +#
> +# The class will facilitate the generation of FIT blobs.
> +#
> +# Glossary
> +#    FIT - Flattened uImage Tree
> +#
> +# Requirements:
> +#
> +#    * The user need to specify the image content using the format specified in the "FIT Image API" section.
> +#
> +# FIT Image API
> +#
> +# The bbclass is using variable and variable flags to declare the FIT image content.
> +#
> +#    * Sub-Images and Configuration Nodes
> +#
> +#       ** A sub-image node content is declared using the format `VAR_NODE[<property-name>] = <value>`.
> +#         * VAR_NODE - freely selected name of the variable representing a node.
> +#         * <property-name> - a sub-image property (e.g. description, type...).
> +#         * <value> - the property value.
> +#             Depending of the property the value can support different formats.
> +#           ** Property Values Formats
> +#
> +#            string property
> +#            ---------------
> +#            format: "<text>" - in case the property expects a text.
> +#                (e.g. IMAGE_NODE_KERNEL[type] = "kernel")
> +#
> +#            address property
> +#            ----------------
> +#            format: "<address>" - in case the property expects an address.
> +#                (e.g. IMAGE_NODE_KERNEL[entry] = "0xABCDABCD")
> +#
> +#            hash property
> +#            -------------
> +#            format: "<hash type>" - for hash property the hash type needs to be specified.
> +#                (e.g. IMAGE_NODE_KERNEL[hash] = "sha256")
> +#
> +#            sub-image signature property
> +#            ----------------------------
> +#            format: "<algo>;<key-name-hint>;" - for image signature node.
> +#                Both algorithm and key name needs to be provided.
> +#                (e.g. IMAGE_NODE_KERNEL[signature] = "sha256,rsa2048;kernel;"
> +#
> +#            configuration signature property
> +#            --------------------------------
> +#            format: "<algo>;<key-name-hint>;<sub-image list>" - for configuration signature properties algorithm,
> +#                key name and sub-image nodes needs to be provided.
> +#                (e.g. CONF_NODE_CONF1[signature] = "sha256,rsa2048;kernel;"kernel","fdt";")
> +#
> +#       ** Sub-Image and Configuration Nodes Flags
> +#              See the code for supported flags.
> +#
> +#    * FIT_IMAGES_NODE - contains a list of variables used to declare the sub-images nodes, separated by space.
> +#                    (e.g. FIT_IMAGES_NODE = "IMAGE_NODE_KERNEL IMAGE_NODE_FDT")
> +#
> +#    * FIT_CONFIGURATIONS_NODE - contains a list of variables used to declare the configuration nodes,
> +#          separated by space. (e.g. FIT_CONFIGURATIONS_NODE = "CONF_NODE_CONF1")
> +#        ** Flags
> +#           - "default": used to configure the default configuration node.
> +#                 (e.g. FIT_CONFIGURATIONS_NODE[default] = "conf@0")
> +#
> +# Example:
> +# This is part of a linux_%.bbappend recipe.
> +#
> +# KERNEL_IMAGE_NODE[name] = "kernel"
> +# KERNEL_IMAGE_NODE[description] = "${PF}"
> +# KERNEL_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/zImage")'
> +# KERNEL_IMAGE_NODE[type] = "kernel"
> +# KERNEL_IMAGE_NODE[arch] = "${ARCH}"
> +# KERNEL_IMAGE_NODE[os] = "linux"
> +# KERNEL_IMAGE_NODE[compression] = "none"
> +# KERNEL_IMAGE_NODE[load] = "${UBOOT_LOADADDRESS}"
> +# KERNEL_IMAGE_NODE[entry] = "${UBOOT_ENTRYPOINT}"
> +# KERNEL_IMAGE_NODE[hash] = "sha256"
> +#
> +# FDT_IMAGE_NODE[name] = "fdt"
> +# FDT_IMAGE_NODE[description] = "FDT blob"
> +# FDT_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone.dtb")'
> +# FDT_IMAGE_NODE[type] = "flat_dt"
> +# FDT_IMAGE_NODE[arch] = "${ARCH}"
> +# FDT_IMAGE_NODE[compression] = "none"
> +# FDT_IMAGE_NODE[hash] = "sha256"
> +#
> +# CONF1_CONF_NODE[name] = "conf"
> +# CONF1_CONF_NODE[description] = "Linux kernel and FDT blob"
> +# CONF1_CONF_NODE[kernel] = "kernel"
> +# CONF1_CONF_NODE[fdt] = "fdt"
> +#
> +# FIT_IMAGES_NODE = "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
> +# FIT_CONFIGURATIONS_NODE = "CONF1_CONF_NODE"
> +# FIT_CONFIGURATIONS_NODE[default] = "${@d.getVarFlag('CONF1_CONF_NODE', 'name') or ""}"
> +#
> +
> +DEPENDS += "\
> +    dtc-native \
> +    u-boot-mkimage-native \
> +"
> +
> +FIT_IMAGE_DESCRIPTION ??= "Generic FIT image"
> +FIT_IMAGE_FILENAME ??= "image-fit"
> +FIT_IMAGE_UBOOT_MKIMAGE_OPTS ??= ""
> +
> +def get_subimage_node_rules():
> +    """
> +    Defines the properties format and validation for sub-image nodes.
> +
> +    :return: Return a dictionary with the format rules.
> +    """
> +
> +    #
> +    # Rules Format: [Mandatory, Template String, Dictionary keys]
> +    # Mandatory: True, False - used to verify if this property is mandatory for generating the image.
> +    #            Note: Doesn't take in consideration the conditionally mandatory property.
> +    #                  (see: U-Boot/doc/uImage.FIT/source_file_format.txt)
> +    # Template String: Property content format. Used to generate the parameter content.
> +    # Dictionary Keys: Keys used to be replaced in the Template String.
> +    #
> +    from collections import OrderedDict
> +
> +    rules = OrderedDict()
> +
> +    rules['description'] = [True, '= "$value"', ["value"]]
> +    rules['data'] = [True, '= $value', ["value"]]
> +    rules['type'] = [True, '= "$value"', ["value"]]
> +    rules['arch'] = [False, '= "$value"', ["value"]]
> +    rules['os'] = [False, '= "$value"', ["value"]]
> +    rules['compression'] = [True, '= "$value"', ["value"]]
> +    rules['load'] = [False, '= <$value>', ["value"]]
> +    rules['entry'] = [False, '= <$value>', ["value"]]
> +    rules['hash'] = [False, '{ algo = "$algo"; }', ['algo']]
> +    rules['signature'] = [False, '{ algo = "$algo"; key-name-hint = "$key"; }', ['algo', 'key']]
> +
> +    return rules
> +
> +
> +def get_conf_node_rules():
> +    """
> +    Defines the properties format and validation for configuration nodes.
> +
> +    :return: Return a dictionary with the format rules.
> +    """
> +    #
> +    # Rules Format: [Mandatory, Template String, Dictionary keys]
> +    # Mandatory: True, False - used to verify if this property is mandatory for generating the image.
> +    #            Note: Doesn't take in consideration the conditionally mandatory property.
> +    #                  (see: U-Boot/doc/uImage.FIT/source_file_format.txt)
> +    # Template String: Property content format. Used to generate the parameter content.
> +    # Dictionary Keys: Keys used to be replaced in the Template String.
> +    #
> +    from collections import OrderedDict
> +
> +    rules = OrderedDict()
> +
> +    rules['description'] = [True, '= "$value"', ["value"]]
> +    rules['kernel'] = [True, '= "$value"', ["value"]]
> +    rules['ramdisk'] = [False, '= "$value"', ["value"]]
> +    rules['fdt'] = [False, '= "$value"', ["value"]]
> +    rules['loadables'] = [False, '= "$value"', ["value"]]
> +    rules['signature'] = [False, '{ algo = "$algo"; key-name-hint = "$key"; sign-images = $images; }',
> +                          ['algo', 'key', 'images']]
> +
> +    return rules
> +
> +
> +def generate_node(name, params, rules):
> +    """
> +    Generates a node.
> +
> +    :param name: Node name.
> +    :param params: A dictionary containing the properties values.
> +    :param rules: A dictionary containing the properties values validation and format.
> +
> +    :return: A string containing the node, including the new line characters.
> +    """
> +    from string import Template
> +
> +    content = []
> +
> +    for rule in rules.keys():
> +        if rule in params.keys():
> +            content.append('{param} {value}; '.format(
> +                param=rule,
> +                value=Template(rules[rule][1]).substitute(
> +                    dict(zip(rules[rule][2], params[rule].split(';'))))))
> +        elif rules[rule][0]:
> +            bb.fatal('Missing mandatory parameter "{param}" from "{section}" section'.format(param=rule, section=name))
> +
> +    content = """
> +                     """.join(content)
> +    node = """   {name} {{
> +                     {content}
> +              }};
> +           """.format(name=name, content=content)
> +
> +    return node
> +
> +
> +def get_section_configuration(var, d):
> +    """
> +    Generates a string build from variable's flags.
> +
> +    :param var: variable to extract the flags.
> +    :param d: bitbake environment.
> +
> +    :return: A string with the format '<flag1> = <value1>; <flag2> = <value2>;...'.
> +    """
> +    flags = d.getVarFlags(var)
> +    if flags is not None:
> +        flags = dict((flag, d.expand(value))
> +                     for flag, value in list(flags.items()))
> +    else:
> +        flags = {}
> +
> +    configuration = ''.join((
> +              """{name} = "{value}";
> +              """.format(name=name, value=value) for name, value in flags.items()))
> +
> +    return configuration
> +
> +
> +def get_section_properties(var, d):
> +    """
> +    Extract the nodes and parameters for a section.
> +
> +    :param var: variable containing the variable names of the nodes that are part of this section.
> +    :param d: bitbake environment.
> +
> +    :return: a list containing dictionaries with section nodes parameters.
> +    """
> +    nodes = []
> +    parameters = {}
> +
> +    for node in d.getVar(var).split():
> +        parameters = d.getVarFlags(node)
> +        if parameters is not None:
> +            parameters = dict((parameter, d.expand(value))
> +                              for parameter, value in list(parameters.items()))
> +            nodes.append(parameters)
> +
> +    return nodes
> +
> +
> +def generate_section(var, rules, d):
> +    """
> +    Generates a section node (configuration or sub-image).
> +
> +    :param var: Variable to extract the node names.
> +    :param rules: Rules to use for generating this section.
> +    :param d: bitbake environment.
> +
> +    :return: A string containing the section, including the new line characters.
> +    """
> +
> +    section = get_section_configuration(var, d)
> +
> +    nodes_parameters = get_section_properties(var, d)
> +    for parameters in nodes_parameters:
> +        name = parameters.pop('name')
> +        node = generate_node(name, parameters, rules)
> +        section += node
> +
> +    return section
> +
> +
> +def get_fit_image_template():
> +    """
> +    Get the FIT format.
> +
> +    :return: A Template string containing the FIT image format.
> +    """
> +    from string import Template
> +
> +    template = Template("""/dts-v1/;
> +        /{
> +             description = "$description";
> +             #address-cells = <1>;
> +             images {
> +                 $images_section
> +             };
> +             configurations {
> +                 $configurations_section
> +             };
> +        };""")
> +    return template
> +
> +
> +def generate_image_tree_source(d):
> +    """
> +    Generates a string containing the image tree source.
> +
> +    :return: A string representing the image tree.
> +    """
> +    from string import Template
> +
> +    values = {}
> +    values['description'] = d.getVar('FIT_IMAGE_DESCRIPTION')
> +
> +    image_rules = get_subimage_node_rules()
> +    if d.getVar('FIT_IMAGES_NODE', False) is None:
> +       bb.fatal("Please add the FIT image nodes to FIT_IMAGES_NODE variable.")
> +    values['images_section'] = generate_section('FIT_IMAGES_NODE', image_rules, d)
> +
> +    conf_rules = get_conf_node_rules()
> +    if d.getVar('FIT_CONFIGURATIONS_NODE', False) is None:
> +       bb.fatal("Please add the FIT configuration nodes to FIT_CONFIGURATIONS_NODE variable.")
> +    values['configurations_section'] = generate_section('FIT_CONFIGURATIONS_NODE', conf_rules, d)
> +
> +    image_tree_source = get_fit_image_template().substitute(values)
> +
> +    return image_tree_source
> +
> +
> +def generate_image_blob(file_name, image, d):
> +    """
> +    Generates a FIT blob.
> +
> +    :param file_name: FIT blob file name.
> +    :param image: String containing the image tree source.
> +    :param d: Bitbake environment.
> +    """
> +    import tempfile
> +    import subprocess
> +
> +    bb.debug(1, "Generated FIT source is:\n {image}".format(image=image))
> +
> +    builddir = d.getVar('B')
> +    blob_file_name = file_name + '.itb'
> +
> +    try:
> +        fd, faux = tempfile.mkstemp(dir=builddir, prefix=file_name, suffix=".its")
> +        with os.fdopen(fd, "w") as f:
> +            f.write(image)
> +
> +        mkimage_opts = d.getVar('FIT_IMAGE_UBOOT_MKIMAGE_OPTS').split() or ""
> +        cmd = ['mkimage', '-f', faux]
> +        cmd.extend(mkimage_opts)
> +        cmd.append('{output_name}'.format(output_name=blob_file_name))
> +
> +        ret = subprocess.run(
> +            cmd,
> +            check=True,
> +            universal_newlines=True,
> +            cwd=builddir,
> +            stderr=subprocess.STDOUT,
> +            stdout=subprocess.PIPE)
> +
> +        bb.debug(1, "Command for generating the FIT blob is:\n {cmd}".format(cmd=" ".join(ret.args)))
> +
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal('Failed to generate the FIT blob: {message}: {output}'.format(
> +            message=str(e), output=e.stdout))
> +    finally:
> +        os.remove(faux)
> +
> +
> +def generate_fit_image(file_name, d):
> +    """
> +    Create and generate FIT blob.
> +
> +    :param file_name: FIT blob file name.
> +    :param d: Bitbake environment.
> +    """
> +    image = generate_image_tree_source(d)
> +    generate_image_blob(file_name, image, d)
> +
> +
> +python fit_image_do_generate_fit_image() {
> +    generate_fit_image(d.getVar('FIT_IMAGE_FILENAME'), d)
> +}
> +
> +do_generate_fit_image[vardeps] += " \
> +    ${FIT_CONFIGURATIONS_NODE} \
> +    ${FIT_IMAGES_NODE} \
> +    FIT_CONFIGURATIONS_NODE \
> +    FIT_IMAGES_NODE \
> +    FIT_IMAGE_FILENAME \
> +"
> +
> +addtask do_generate_fit_image after do_compile before do_deploy
> +
> +EXPORT_FUNCTIONS do_generate_fit_image
> --
> 2.24.1
>
> 
