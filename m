Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DEEC48BE4
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 16:59:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.18096.1660669142447483395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FYiLmgbd;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d16so9731718pll.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zV2J1wmdypdKCpDtsdI9Z67FTy+9PhG8U9/GlbPw1ro=;
        b=FYiLmgbdYNdCHLCMM9MVBkuHNoWOS7WFzMNCtZDzc0quV+od/oWrsdBKZaKBSJ9L3K
         dsEFWY5ToRgzdhD4yrZNq5+f6P2Ljd9sEFS1Y7B7Jsdo35GqOwkgMQ+Udp22IUXjzDef
         QasbL6jNu9k2Lwjjr23YsFUyac2xbusiAVklo047C9ucaRshRy1TQYtmVVZtWCI+D1Lq
         1jECTJ3r+unZibAggBLm70Jl+A/RSrFnzbBr6M2z5LtVjPfQQDwhMkCWPDFaBrpNklKX
         500Ck4iSSGi9GBGezRGAAGUpOs+ljMgqf5yCr+3/MNBsRypNGZfDLt3c9QktCbhR31AM
         V0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zV2J1wmdypdKCpDtsdI9Z67FTy+9PhG8U9/GlbPw1ro=;
        b=R+Z6jK3PhSex/5GaQ+2dBLciKuyeA5r+f5Ta8kztrU89XkFnthomRNWAmkjooi5MOb
         dkOx2q0PIBBXAdtekp1TCAFqemprk4wU1JrZGRqu5nCFo1UAGPP4csqFuJHcmtE5wc/9
         GroS1K+peFt1lhW1ExunQN4EbOQQvhNdjY43agoO/QfpT/K4op0TFVmwiZFvaXUxaYnk
         5AQq1SRQUZnWIX+G8uYOQ2EB7gjwKYXWlihQ4su2Ogit+VzUaiXd0PWEhu38KLZ7U7WJ
         MDM0ow4W/ne4my3E59hb+S2CtaiasKGcampAw30pTJWPcIahr6labhIMv5ku82bbT0YP
         2KsQ==
X-Gm-Message-State: ACgBeo0kO3plgSBvyCZkyW1ZdFBJGgg3bDUdhNzAo4HExIEJc/OsqsVo
	/MMbHv3UzFTCSlaCREhGH2Rt/1FwgggMyg==
X-Google-Smtp-Source: 
 AA6agR6loPkpSphZnxCYVfqtntVApUuCit1G4pC5l/kJ61GWEOChqRrh1NEXopOzRK91JgniN7WoeQ==
X-Received: by 2002:a17:902:ce90:b0:16e:f7c3:c478 with SMTP id
 f16-20020a170902ce9000b0016ef7c3c478mr22756851plg.82.1660669141289;
        Tue, 16 Aug 2022 09:59:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a17090a531500b001f04479017fsm6562577pjh.29.2022.08.16.09.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:59:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/7] vulkan-samples: Qualify move as std::move
Date: Tue, 16 Aug 2022 09:58:52 -0700
Message-Id: <20220816165857.2342796-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816165857.2342796-1-raj.khem@gmail.com>
References: <20220816165857.2342796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 16:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169443

Fixes build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Qualify-move-as-std-move.patch       | 405 ++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |   1 +
 2 files changed, 406 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch
new file mode 100644
index 00000000000..80ee521499f
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch
@@ -0,0 +1,405 @@
+From 9e061b12b9305eee96a4d3129b646c244cc02347 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Aug 2022 19:16:45 -0700
+Subject: [PATCH] Qualify move as std::move
+
+Seeing errors like below with clang-15
+
+spirv_common.hpp:692:19: error: unqualified call to std::move
+
+squashed Backport of following upstream commits
+
+https://github.com/KhronosGroup/SPIRV-Cross/commit/44c3333a1c315ead00c24f7aef5fa8a7ccf49299
+https://github.com/KhronosGroup/SPIRV-Cross/commit/0eda71c40936586ea812d0d20d93c11a3e9af192
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Cross/commit/0eda71c40936586ea812d0d20d93c11a3e9af192]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ main.cpp          | 38 +++++++++++++++++++-------------------
+ spirv_common.hpp  |  2 +-
+ spirv_cpp.hpp     |  2 +-
+ spirv_cross.cpp   | 18 +++++++++---------
+ spirv_glsl.cpp    |  2 +-
+ spirv_glsl.hpp    |  2 +-
+ spirv_hlsl.cpp    |  4 ++--
+ spirv_hlsl.hpp    |  2 +-
+ spirv_msl.cpp     |  2 +-
+ spirv_parser.cpp  |  4 ++--
+ spirv_reflect.hpp |  2 +-
+ 11 files changed, 39 insertions(+), 39 deletions(-)
+
+diff --git a/main.cpp b/main.cpp
+index 78991094..581c5e3b 100644
+--- a/main.cpp
++++ b/main.cpp
+@@ -65,7 +65,7 @@ struct CLICallbacks
+ struct CLIParser
+ {
+ 	CLIParser(CLICallbacks cbs_, int argc_, char *argv_[])
+-	    : cbs(move(cbs_))
++	    : cbs(std::move(cbs_))
+ 	    , argc(argc_)
+ 	    , argv(argv_)
+ 	{
+@@ -722,7 +722,7 @@ static int main_inner(int argc, char *argv[])
+ 		auto old_name = parser.next_string();
+ 		auto new_name = parser.next_string();
+ 		auto model = stage_to_execution_model(parser.next_string());
+-		args.entry_point_rename.push_back({ old_name, new_name, move(model) });
++		args.entry_point_rename.push_back({ old_name, new_name, std::move(model) });
+ 	});
+ 	cbs.add("--entry", [&args](CLIParser &parser) { args.entry = parser.next_string(); });
+ 	cbs.add("--stage", [&args](CLIParser &parser) { args.entry_stage = parser.next_string(); });
+@@ -731,20 +731,20 @@ static int main_inner(int argc, char *argv[])
+ 		HLSLVertexAttributeRemap remap;
+ 		remap.location = parser.next_uint();
+ 		remap.semantic = parser.next_string();
+-		args.hlsl_attr_remap.push_back(move(remap));
++		args.hlsl_attr_remap.push_back(std::move(remap));
+ 	});
+ 
+ 	cbs.add("--remap", [&args](CLIParser &parser) {
+ 		string src = parser.next_string();
+ 		string dst = parser.next_string();
+ 		uint32_t components = parser.next_uint();
+-		args.remaps.push_back({ move(src), move(dst), components });
++		args.remaps.push_back({ std::move(src), std::move(dst), components });
+ 	});
+ 
+ 	cbs.add("--remap-variable-type", [&args](CLIParser &parser) {
+ 		string var_name = parser.next_string();
+ 		string new_type = parser.next_string();
+-		args.variable_type_remaps.push_back({ move(var_name), move(new_type) });
++		args.variable_type_remaps.push_back({ std::move(var_name), std::move(new_type) });
+ 	});
+ 
+ 	cbs.add("--rename-interface-variable", [&args](CLIParser &parser) {
+@@ -757,18 +757,18 @@ static int main_inner(int argc, char *argv[])
+ 
+ 		uint32_t loc = parser.next_uint();
+ 		string var_name = parser.next_string();
+-		args.interface_variable_renames.push_back({ cls, loc, move(var_name) });
++		args.interface_variable_renames.push_back({ cls, loc, std::move(var_name) });
+ 	});
+ 
+ 	cbs.add("--pls-in", [&args](CLIParser &parser) {
+ 		auto fmt = pls_format(parser.next_string());
+ 		auto name = parser.next_string();
+-		args.pls_in.push_back({ move(fmt), move(name) });
++		args.pls_in.push_back({ std::move(fmt), std::move(name) });
+ 	});
+ 	cbs.add("--pls-out", [&args](CLIParser &parser) {
+ 		auto fmt = pls_format(parser.next_string());
+ 		auto name = parser.next_string();
+-		args.pls_out.push_back({ move(fmt), move(name) });
++		args.pls_out.push_back({ std::move(fmt), std::move(name) });
+ 	});
+ 	cbs.add("--shader-model", [&args](CLIParser &parser) {
+ 		args.shader_model = parser.next_uint();
+@@ -788,7 +788,7 @@ static int main_inner(int argc, char *argv[])
+ 	cbs.default_handler = [&args](const char *value) { args.input = value; };
+ 	cbs.error_handler = [] { print_help(); };
+ 
+-	CLIParser parser{ move(cbs), argc - 1, argv + 1 };
++	CLIParser parser{ std::move(cbs), argc - 1, argv + 1 };
+ 	if (!parser.parse())
+ 	{
+ 		return EXIT_FAILURE;
+@@ -808,14 +808,14 @@ static int main_inner(int argc, char *argv[])
+ 	auto spirv_file = read_spirv_file(args.input);
+ 	if (spirv_file.empty())
+ 		return EXIT_FAILURE;
+-	Parser spirv_parser(move(spirv_file));
++	Parser spirv_parser(std::move(spirv_file));
+ 
+ 	spirv_parser.parse();
+ 
+ 	// Special case reflection because it has little to do with the path followed by code-outputting compilers
+ 	if (!args.reflect.empty())
+ 	{
+-		CompilerReflection compiler(move(spirv_parser.get_parsed_ir()));
++		CompilerReflection compiler(std::move(spirv_parser.get_parsed_ir()));
+ 		compiler.set_format(args.reflect);
+ 		auto json = compiler.compile();
+ 		if (args.output)
+@@ -831,13 +831,13 @@ static int main_inner(int argc, char *argv[])
+ 
+ 	if (args.cpp)
+ 	{
+-		compiler.reset(new CompilerCPP(move(spirv_parser.get_parsed_ir())));
++		compiler.reset(new CompilerCPP(std::move(spirv_parser.get_parsed_ir())));
+ 		if (args.cpp_interface_name)
+ 			static_cast<CompilerCPP *>(compiler.get())->set_interface_name(args.cpp_interface_name);
+ 	}
+ 	else if (args.msl)
+ 	{
+-		compiler.reset(new CompilerMSL(move(spirv_parser.get_parsed_ir())));
++		compiler.reset(new CompilerMSL(std::move(spirv_parser.get_parsed_ir())));
+ 
+ 		auto *msl_comp = static_cast<CompilerMSL *>(compiler.get());
+ 		auto msl_opts = msl_comp->get_msl_options();
+@@ -850,13 +850,13 @@ static int main_inner(int argc, char *argv[])
+ 		msl_comp->set_msl_options(msl_opts);
+ 	}
+ 	else if (args.hlsl)
+-		compiler.reset(new CompilerHLSL(move(spirv_parser.get_parsed_ir())));
++		compiler.reset(new CompilerHLSL(std::move(spirv_parser.get_parsed_ir())));
+ 	else
+ 	{
+ 		combined_image_samplers = !args.vulkan_semantics;
+ 		if (!args.vulkan_semantics)
+ 			build_dummy_sampler = true;
+-		compiler.reset(new CompilerGLSL(move(spirv_parser.get_parsed_ir())));
++		compiler.reset(new CompilerGLSL(std::move(spirv_parser.get_parsed_ir())));
+ 	}
+ 
+ 	if (!args.variable_type_remaps.empty())
+@@ -867,7 +867,7 @@ static int main_inner(int argc, char *argv[])
+ 					out = remap.new_variable_type;
+ 		};
+ 
+-		compiler->set_variable_type_remap_callback(move(remap_cb));
++		compiler->set_variable_type_remap_callback(std::move(remap_cb));
+ 	}
+ 
+ 	for (auto &rename : args.entry_point_rename)
+@@ -1019,7 +1019,7 @@ static int main_inner(int argc, char *argv[])
+ 	{
+ 		auto active = compiler->get_active_interface_variables();
+ 		res = compiler->get_shader_resources(active);
+-		compiler->set_enabled_interface_variables(move(active));
++		compiler->set_enabled_interface_variables(std::move(active));
+ 	}
+ 	else
+ 		res = compiler->get_shader_resources();
+@@ -1034,7 +1034,7 @@ static int main_inner(int argc, char *argv[])
+ 
+ 	auto pls_inputs = remap_pls(args.pls_in, res.stage_inputs, &res.subpass_inputs);
+ 	auto pls_outputs = remap_pls(args.pls_out, res.stage_outputs, nullptr);
+-	compiler->remap_pixel_local_storage(move(pls_inputs), move(pls_outputs));
++	compiler->remap_pixel_local_storage(std::move(pls_inputs), std::move(pls_outputs));
+ 
+ 	for (auto &ext : args.extensions)
+ 		compiler->require_extension(ext);
+@@ -1101,7 +1101,7 @@ static int main_inner(int argc, char *argv[])
+ 	for (uint32_t i = 0; i < args.iterations; i++)
+ 	{
+ 		if (args.hlsl)
+-			glsl = static_cast<CompilerHLSL *>(compiler.get())->compile(move(args.hlsl_attr_remap));
++			glsl = static_cast<CompilerHLSL *>(compiler.get())->compile(std::move(args.hlsl_attr_remap));
+ 		else
+ 			glsl = compiler->compile();
+ 	}
+diff --git a/spirv_common.hpp b/spirv_common.hpp
+index aa32142d..0daf5ad5 100644
+--- a/spirv_common.hpp
++++ b/spirv_common.hpp
+@@ -536,7 +536,7 @@ struct SPIRExpression : IVariant
+ 
+ 	// Only created by the backend target to avoid creating tons of temporaries.
+ 	SPIRExpression(std::string expr, uint32_t expression_type_, bool immutable_)
+-	    : expression(move(expr))
++	    : expression(std::move(expr))
+ 	    , expression_type(expression_type_)
+ 	    , immutable(immutable_)
+ 	{
+diff --git a/spirv_cpp.hpp b/spirv_cpp.hpp
+index bcdb669b..b4da84b9 100644
+--- a/spirv_cpp.hpp
++++ b/spirv_cpp.hpp
+@@ -27,7 +27,7 @@ class CompilerCPP : public CompilerGLSL
+ {
+ public:
+ 	explicit CompilerCPP(std::vector<uint32_t> spirv_)
+-	    : CompilerGLSL(move(spirv_))
++	    : CompilerGLSL(std::move(spirv_))
+ 	{
+ 	}
+ 
+diff --git a/spirv_cross.cpp b/spirv_cross.cpp
+index 19bac301..d21dbd41 100644
+--- a/spirv_cross.cpp
++++ b/spirv_cross.cpp
+@@ -28,16 +28,16 @@ using namespace spirv_cross;
+ 
+ Compiler::Compiler(vector<uint32_t> ir_)
+ {
+-	Parser parser(move(ir_));
++	Parser parser(std::move(ir_));
+ 	parser.parse();
+-	set_ir(move(parser.get_parsed_ir()));
++	set_ir(std::move(parser.get_parsed_ir()));
+ }
+ 
+ Compiler::Compiler(const uint32_t *ir_, size_t word_count)
+ {
+ 	Parser parser(ir_, word_count);
+ 	parser.parse();
+-	set_ir(move(parser.get_parsed_ir()));
++	set_ir(std::move(parser.get_parsed_ir()));
+ }
+ 
+ Compiler::Compiler(const ParsedIR &ir_)
+@@ -47,12 +47,12 @@ Compiler::Compiler(const ParsedIR &ir_)
+ 
+ Compiler::Compiler(ParsedIR &&ir_)
+ {
+-	set_ir(move(ir_));
++	set_ir(std::move(ir_));
+ }
+ 
+ void Compiler::set_ir(ParsedIR &&ir_)
+ {
+-	ir = move(ir_);
++	ir = std::move(ir_);
+ 	parse_fixup();
+ }
+ 
+@@ -716,7 +716,7 @@ unordered_set<uint32_t> Compiler::get_active_interface_variables() const
+ 
+ void Compiler::set_enabled_interface_variables(std::unordered_set<uint32_t> active_variables)
+ {
+-	active_interface_variables = move(active_variables);
++	active_interface_variables = std::move(active_variables);
+ 	check_active_interface_variables = true;
+ }
+ 
+@@ -2163,7 +2163,7 @@ void Compiler::CombinedImageSamplerHandler::push_remap_parameters(const SPIRFunc
+ 	unordered_map<uint32_t, uint32_t> remapping;
+ 	for (uint32_t i = 0; i < length; i++)
+ 		remapping[func.arguments[i].id] = remap_parameter(args[i]);
+-	parameter_remapping.push(move(remapping));
++	parameter_remapping.push(std::move(remapping));
+ }
+ 
+ void Compiler::CombinedImageSamplerHandler::pop_remap_parameters()
+@@ -3611,7 +3611,7 @@ void Compiler::analyze_image_and_sampler_usage()
+ 
+ 	CombinedImageSamplerUsageHandler handler(*this, dref_handler.dref_combined_samplers);
+ 	traverse_all_reachable_opcodes(get<SPIRFunction>(ir.default_entry_point), handler);
+-	comparison_ids = move(handler.comparison_ids);
++	comparison_ids = std::move(handler.comparison_ids);
+ 	need_subpass_input = handler.need_subpass_input;
+ 
+ 	// Forward information from separate images and samplers into combined image samplers.
+@@ -3650,7 +3650,7 @@ void Compiler::build_function_control_flow_graphs_and_analyze()
+ 	CFGBuilder handler(*this);
+ 	handler.function_cfgs[ir.default_entry_point].reset(new CFG(*this, get<SPIRFunction>(ir.default_entry_point)));
+ 	traverse_all_reachable_opcodes(get<SPIRFunction>(ir.default_entry_point), handler);
+-	function_cfgs = move(handler.function_cfgs);
++	function_cfgs = std::move(handler.function_cfgs);
+ 
+ 	for (auto &f : function_cfgs)
+ 	{
+diff --git a/spirv_glsl.cpp b/spirv_glsl.cpp
+index a8855987..fabbb105 100644
+--- a/spirv_glsl.cpp
++++ b/spirv_glsl.cpp
+@@ -6876,7 +6876,7 @@ void CompilerGLSL::emit_instruction(const Instruction &instruction)
+ 		bool ptr_chain = opcode == OpPtrAccessChain;
+ 		auto e = access_chain(ops[2], &ops[3], length - 3, get<SPIRType>(ops[0]), &meta, ptr_chain);
+ 
+-		auto &expr = set<SPIRExpression>(ops[1], move(e), ops[0], should_forward(ops[2]));
++		auto &expr = set<SPIRExpression>(ops[1], std::move(e), ops[0], should_forward(ops[2]));
+ 
+ 		auto *backing_variable = maybe_get_backing_variable(ops[2]);
+ 		expr.loaded_from = backing_variable ? backing_variable->self : ops[2];
+diff --git a/spirv_glsl.hpp b/spirv_glsl.hpp
+index caf0ad3b..aac1196e 100644
+--- a/spirv_glsl.hpp
++++ b/spirv_glsl.hpp
+@@ -138,7 +138,7 @@ public:
+ 	}
+ 
+ 	explicit CompilerGLSL(std::vector<uint32_t> spirv_)
+-	    : Compiler(move(spirv_))
++	    : Compiler(std::move(spirv_))
+ 	{
+ 		init();
+ 	}
+diff --git a/spirv_hlsl.cpp b/spirv_hlsl.cpp
+index a5b6d2dc..0933017e 100644
+--- a/spirv_hlsl.cpp
++++ b/spirv_hlsl.cpp
+@@ -2028,7 +2028,7 @@ void CompilerHLSL::emit_function_prototype(SPIRFunction &func, const Bitset &ret
+ 		out_argument += " ";
+ 		out_argument += "SPIRV_Cross_return_value";
+ 		out_argument += type_to_array_glsl(type);
+-		arglist.push_back(move(out_argument));
++		arglist.push_back(std::move(out_argument));
+ 	}
+ 
+ 	for (auto &arg : func.arguments)
+@@ -4553,7 +4553,7 @@ void CompilerHLSL::require_texture_query_variant(const SPIRType &type)
+ 
+ string CompilerHLSL::compile(std::vector<HLSLVertexAttributeRemap> vertex_attributes)
+ {
+-	remap_vertex_attributes = move(vertex_attributes);
++	remap_vertex_attributes = std::move(vertex_attributes);
+ 	return compile();
+ }
+ 
+diff --git a/spirv_hlsl.hpp b/spirv_hlsl.hpp
+index b2b60fca..3503c674 100644
+--- a/spirv_hlsl.hpp
++++ b/spirv_hlsl.hpp
+@@ -63,7 +63,7 @@ public:
+ 	};
+ 
+ 	explicit CompilerHLSL(std::vector<uint32_t> spirv_)
+-	    : CompilerGLSL(move(spirv_))
++	    : CompilerGLSL(std::move(spirv_))
+ 	{
+ 	}
+ 
+diff --git a/spirv_msl.cpp b/spirv_msl.cpp
+index 0e1e733d..fbfcdba5 100644
+--- a/spirv_msl.cpp
++++ b/spirv_msl.cpp
+@@ -32,7 +32,7 @@ static const uint32_t k_aux_mbr_idx_swizzle_const = 0u;
+ 
+ CompilerMSL::CompilerMSL(vector<uint32_t> spirv_, vector<MSLVertexAttr> *p_vtx_attrs,
+                          vector<MSLResourceBinding> *p_res_bindings)
+-    : CompilerGLSL(move(spirv_))
++    : CompilerGLSL(std::move(spirv_))
+ {
+ 	if (p_vtx_attrs)
+ 		for (auto &va : *p_vtx_attrs)
+diff --git a/spirv_parser.cpp b/spirv_parser.cpp
+index 1725b4ca..0fcd7691 100644
+--- a/spirv_parser.cpp
++++ b/spirv_parser.cpp
+@@ -24,7 +24,7 @@ namespace spirv_cross
+ {
+ Parser::Parser(std::vector<uint32_t> spirv)
+ {
+-	ir.spirv = move(spirv);
++	ir.spirv = std::move(spirv);
+ }
+ 
+ Parser::Parser(const uint32_t *spirv_data, size_t word_count)
+@@ -223,7 +223,7 @@ void Parser::parse(const Instruction &instruction)
+ 	case OpExtension:
+ 	{
+ 		auto ext = extract_string(ir.spirv, instruction.offset);
+-		ir.declared_extensions.push_back(move(ext));
++		ir.declared_extensions.push_back(std::move(ext));
+ 		break;
+ 	}
+ 
+diff --git a/spirv_reflect.hpp b/spirv_reflect.hpp
+index 13b5b431..f5c6a6ff 100644
+--- a/spirv_reflect.hpp
++++ b/spirv_reflect.hpp
+@@ -34,7 +34,7 @@ class CompilerReflection : public CompilerGLSL
+ 
+ public:
+ 	explicit CompilerReflection(std::vector<uint32_t> spirv_)
+-	    : Parent(move(spirv_))
++	    : Parent(std::move(spirv_))
+ 	{
+ 		options.vulkan_semantics = true;
+ 	}
+-- 
+2.37.2
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 41cb4a437d3..54994c683d2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
+           file://0001-Qualify-move-as-std-move.patch;patchdir=third_party/spirv-cross \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.37.2


