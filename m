Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.102])
 by mx.groups.io with SMTP id smtpd.web08.4416.1624606629344485305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 00:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Ur4atQCW;
 spf=pass (domain: prevas.dk, ip: 40.107.15.102, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6iFgx6E9+phSC2Dc4zuo4DwYx+achob8CECncM7TVmh4gtGI5G/+0HWNos22PPZwIxBVhfue7gxzzAfHT5NMR26rpwgFVrpxgVtncm8blJaDB0m5PAa0F53kQ3mqShs32SJR6G8d4zp8xcRdHkPitXE+JACGd/QaB9XFH82QI0EHjVdttus9D9rcmPcZS74iyOEG9FBUW4Dqk5ASLwpuiKGAcTcTeBtQCnoMJjRIKS99bvvZ4rPKrhNrh9OjTWaId9tnbksLscVuvd2zIc0veIxrsMR85DpY1SkWjIccD2G54dWYrUjkT82SEikJRgbIQdKRQM4bYnyNm++2+96jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1b/LAwS3Pn5o6AwtoGhT3FkGG/Byqv4iIl3vk1I1p4=;
 b=KSqynKEwgWRFk1evprk9uSFsjF5OucMFecYVWRIRBIs1Ef70EaRvf4UbMuuO92YGtNoLNkTixaGd0rOSHB6olQWmK98hM3YbHlyfSm792cG+07l9kNhaBAJ/GP/Abdk+S+Oub5HAKNlUlKLIGn1RCWrp621TANRKvSZCrGfJneJFfWvspQJbQkbcOka0/C8WCZ4GhY4uQhRCDmv1UnccZyjfR4E/FeS2N6q2stApbDVdCpz8YbZvxhhIDEx6pqGZy0iIaZus2rY8hySCwJeocRpDDuspusjrOYK6rNE3Gl5I0ztuzs4c3kjywl1MQBk40TrXdgTPWsO9Zl9thW1n3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1b/LAwS3Pn5o6AwtoGhT3FkGG/Byqv4iIl3vk1I1p4=;
 b=Ur4atQCWXypuDr2bjTLu58TPj+icfUoySxpk1Adsg3+ZNBYf4q/vO7wUoQ+ywtjjGSvQlEUfKQx9aivgtkGFq5ZEx0qQGB0OC12x6P8O72GiGUs1rMw7/tOLcINCJpm4RfCyxwdh3AwwVuIuQVlgDJ/jbhNahWVoxDZduyNnfMA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM9PR10MB4402.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:269::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 07:37:06 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb%7]) with mapi id 15.20.4242.027; Fri, 25 Jun 2021
 07:37:06 +0000
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Subject: RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
Message-ID: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
Date: Fri, 25 Jun 2021 09:37:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: AM6PR10CA0070.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::47) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.64.110) by AM6PR10CA0070.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 07:37:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d124e9d6-5a84-4298-8d15-08d937ac0837
X-MS-TrafficTypeDiagnostic: AM9PR10MB4402:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB4402C4B9895A3E1403CB699293069@AM9PR10MB4402.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TXhh9dicww/WBBEE+4ni5w5GNK5Mm+l8WV1uxRcdbveq7Y9m+xSuuXf4dU/nxoCh23CuqxUmGI8aRg18cIgyaEKr4YB9soP+oRiggieHOUqrhM6nImyzQkCbUWd4zyJs2MxdXRKW2AsPWieCWN23J0wQBmuwXBfniI4XowB3t+xTWL1Hk06GtED1c9Q8Ho3Q/kFxnF4VCoIcS+/FlRmPRkxQItoqnS1WD1TR3rPGjMd9FnsXikJFrVRaSg/YltMah0VCbFyp2+Y+tdHj7GIdYfi7Kds+jzo7nKA7Ur6Ya1J/VLvUXKmeWxalC/nRmk3RS2ba2dPomaAvrFxF0pmq4/RKq5mCVy/6Dce8gR+75bOoGKsXFYbanuYRF/4P5hUTCD8tJ08LdqEBMjZiuQMb22wLNQbBanrPyNK+svU30EIb/ASfRuqYFxNbs3mO6JdFY+huYDugnrHH/XhVDANREf7SobMfmYv40nXBh/Y+04YoceJmWC384awXOOWQ9kyPLI3iz5yWSAYchcg4CwOV/pjkcci1QaquQChd5pvqpcvU9CEWhpiok+k6TYEhj3H6ncG/Nhz7uAdjiNBYrGE1bU/2oeQzCj4rvatKWoJQgC5GcFugR3vbqh3Yzkdvsth3+kofGwkq439wzkOthepW0cArfDCj/8C84DlJHvwKCeMnjXArYqz4bfnRdHz8mwLL9rttDmAp+4ztfuhGk2YzQ7n7/SB9v89jHH1IH3vno1IjXiDd7CbaGOUkpHRTJ9klXsEvoFgQTTdiTmxq2sKIDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39840400004)(136003)(376002)(346002)(366004)(2906002)(86362001)(956004)(8976002)(38100700002)(6486002)(38350700002)(44832011)(8936002)(2616005)(36756003)(83380400001)(316002)(186003)(66946007)(6916009)(66476007)(5660300002)(52116002)(66556008)(31686004)(26005)(31696002)(16576012)(16526019)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?Windows-1252?Q?v/O/1cIm5OluZ64/SJK0/166dxIYEUTxmj+Wcj8E2dpBTxYgRkk0oSep?=
 =?Windows-1252?Q?fE3r547UPb/4RkG6xOKPcENTJI+ADRe6tBdB80rp7uWaCABP4Lh5qICs?=
 =?Windows-1252?Q?/j264jeFM4B/PH3jL63gqhKi27cXEVHHyj1gnqkUqEx+sBD81NeHrq/u?=
 =?Windows-1252?Q?ivx0ifneLYeDE8BfJBaTHsOmYwRZImVglhJ4J+SURaveRtFT0nc+QDZn?=
 =?Windows-1252?Q?4GIQURDFoUBR6N55vqLAT0n22ZPY2W/kmbvWcl4ENIlsglgtlDMvVtPC?=
 =?Windows-1252?Q?226U902b9xPoyxV+BZajYLXs193BKjnW2u1ZC8S7rl/2r+xWa+nSfAyR?=
 =?Windows-1252?Q?aDFqto+96e6cCclA8oY72xAauPsLbLk6LyzYyb/G92sRldXXmNmT+4Fn?=
 =?Windows-1252?Q?/FZue6OzkQu/ovoAki0j5v31keH2U5zUU/7ZiIKyMvZtfNwPNvuq5Utq?=
 =?Windows-1252?Q?YiJ9vNRnYVT9kSGhhxvQiu5xnbSmDfUz5t4pnxpD1TS2l/sRFEb55h0K?=
 =?Windows-1252?Q?HSCor2lSdVZNnPDJZjn+0IAmee8Se7iUzve1dWp9umGIHA4+4G6ZzIOm?=
 =?Windows-1252?Q?kpAoEXa69sMjvVaa1oOhML8dcqEShQ0dC6rG7EvHg6k7xETT5xpurMbc?=
 =?Windows-1252?Q?2j/zSTLNuzHmHSgvHXDaaHsB7AS8Rl6yYaSCa54R/eFFwPUFMTwYNTbq?=
 =?Windows-1252?Q?F6wXgdBnt9DWZqZx1tJodFANUceLGRRH2T4YlmDQwc5sTx0ev0UX7bxH?=
 =?Windows-1252?Q?d2agrareiCCiQQ8nwXEzZ+KCmJwrLfY1EPGsnWPRUmCdVBqI+aGMaow6?=
 =?Windows-1252?Q?cx/7O+LylLu4OP58Sf8OvMMt5raOKOMv0h5R6PhkZRE5eTb97domgs/h?=
 =?Windows-1252?Q?/cc/HGrMRgcVib314yoDc7OiTK7VAo1UUQ8qcZ6wf+9P9v74sRG5/3du?=
 =?Windows-1252?Q?mlUWlygS6SGyg1qfR7JeNAlntPNaeJoS/m5DSBxpQdpKdgC3IHOazaW7?=
 =?Windows-1252?Q?UA/6hW49pK9lAecfFgwivNev3qsFYQoMs4ymOESpoc74JFXinqISs6Wr?=
 =?Windows-1252?Q?cybF/acekEoHV6Alqcsl1QQghKWX7fG46vgMtTsu9co71aXhisfkvYjl?=
 =?Windows-1252?Q?x392LRrI9BWI906+BRGk4HBb0EDvQprX3W/dhE4G4UKJP7hKKFf6X3u1?=
 =?Windows-1252?Q?zV+Jt90D/zGNNVLWQnQPeXcu8bww9NljPJR5wbDN3XDifhf4n65gp67Q?=
 =?Windows-1252?Q?I5nllal2CAg9dxRpVffZj5BvT4BuwTB6i7wQEz5BXmv+DMToVHN/j64Y?=
 =?Windows-1252?Q?RmIS5KURCVSezcqXGI+ECpMRVH8NrUXhBw58GDcX/lGEbh79RZB6GWYY?=
 =?Windows-1252?Q?4lma5z1kqe1/leBpb6Rq7hVbD8mFRYyQ1sr40guslBDNKiEEOZZlMXaE?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d124e9d6-5a84-4298-8d15-08d937ac0837
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 07:37:06.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6n9w9yN4eO4vbdknBuI8GaCrtjHwmx3eUnT2FuRItscTTc9EIDkHG0kuc3aZuRclgDRbZEi48goKitGxsmRqsjfkLYG4LPYCPn0qX00UAQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4402
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I noticed that if I have an image recipe that says

IMAGE_INSTALL += "kernel-module-foo"

it fails as expected when the kernel hasn't been built with CONFIG_FOO=m.

However, if at the same time some other package which happens to get
installed in the same image says

RRECOMMENDS_${PN} += "kernel-module-foo"

the image build silently succeeds, obviously without any foo.ko
included. This doesn't seem right. [I'm well aware that the RRECOMMENDS
line alone works as expected, this is about the case where both the
above lines are in play.]

=====

So I discovered this while trying to figure out how to be able to say
IMAGE_INSTALL += "kernel-module-ext4" , and have that succeed whenever
ext4 is builtin or modular, and have it be a build time error if the
kernel was built with EXT4=n - so the recommends approach is out.  It
obviously doesn't work out-of-the-box for the EXT4=y case. So now I'm
contemplating doing

python kernel_base_provide_builtin () {
    kname = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
    builtin = os.path.join(d.getVar("PKGD"), "lib/modules",
d.getVar("KERNEL_VERSION"), "modules.builtin")
    if not os.path.exists(builtin):
        return
    builtin_mods = []
    with open(builtin) as f:
        for mod in f:
            mod = mod.strip()
            mod = os.path.basename(mod)
            if not mod.endswith(".ko"):
                continue
            mod = mod[:-3]
            mod = mod.lower().replace("_", "-")
            builtin_mods.append("%s-module-%s" % (kname, mod))

    basepkg = kname + "-base"
    rprovides = (d.getVar("RPROVIDES_" + basepkg) or "").split()
    rprovides += builtin_mods
    d.setVar("RPROVIDES_" + basepkg, " ".join(rprovides))
}
PACKAGESPLITFUNCS += "kernel_base_provide_builtin"

i.e., make sure that the kernel-base package is an rprovider of
kernel-module-ext4 for the EXT4=y case [*]. That seems to work as
expected in the cases I've tried (provided nobody rrecommends ext4, per
above). Does anybody see anything wrong with that approach? EXT4 is just
an example, I'm gonna use it for other modules/subsystems with more
complicated dependencies that might not be satisfied in a base .config,
so a fragment saying CONFIG_FOO=m might have been ignored due to that,
and I'd prefer catching that no later than at image build time.

I'm not necessarily suggesting the above for oe-core, I can live with it
in my own kernel recipes.

[*] kernel-base and not the package containing the actual kernel binary,
because kernel-base contains the modules.builtin file which is what
modprobe consults first to see if it actually has to do anything, so it
makes sense to have kernel-module-ext4 pull in that file and the other
/lib/modules/ metadata when EXT4=y. The kernel binary is as often as not
not actually in the rootfs image, and wouldn't be useful to modprobe anyway.

Rasmus
